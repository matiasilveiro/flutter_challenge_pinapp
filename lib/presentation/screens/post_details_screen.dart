import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/providers.dart';

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
          return ListView(
            children: [
              ListTile(
                title: Text(post?.title ?? ''),
                subtitle: Text(post?.body ?? ''),
              ),
              const Divider(),
              const Text('Comments'),
              postDetails.comments.when(
                data: (comments) {
                  return Column(
                    children: comments
                        .map(
                          (comment) => ListTile(
                            title: Text(comment.name),
                            subtitle: Text(comment.body),
                          ),
                        )
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
}
