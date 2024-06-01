import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/comment.dart';
import '../../domain/post.dart';
import '../notifiers/providers.dart';
import '../widgets/comment_item.dart';

class PostDetailsScreen extends ConsumerStatefulWidget {
  static const name = 'PostDetailsScreen';

  const PostDetailsScreen({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  ConsumerState<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends ConsumerState<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final postDetails = ref.watch(postDetailsProvider(widget.postId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post details'),
      ),
      body: postDetails.post.when(
        data: (post) {
          if (post == null) {
            return const Center(
              child: Text('An error ocurred'),
            );
          }
          return _PostDetails(
            post: post,
            asyncComments: postDetails.comments,
            onRefresh: _onRefresh,
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await ref.read(postDetailsProvider(widget.postId).notifier).refresh();
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({
    super.key,
    required this.post,
    required this.asyncComments,
    required this.onRefresh,
  });

  final Post post;
  final AsyncValue<List<Comment>> asyncComments;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Text(
              post.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(),
            Text(
              'Comments',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            asyncComments.when(
              data: (comments) {
                return Column(
                  children: comments
                      .map((comment) => CommentItem(comment: comment))
                      .toList(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: Text('Error: $error'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
