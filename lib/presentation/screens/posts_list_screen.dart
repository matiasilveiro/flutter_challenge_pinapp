import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_router.dart';
import '../../domain/post.dart';
import '../notifiers/providers.dart';
import 'post_details_screen.dart';

class PostsListScreen extends ConsumerStatefulWidget {
  static const name = 'PostsListScreen';

  const PostsListScreen({super.key});

  @override
  ConsumerState<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends ConsumerState<PostsListScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: posts.when(
        data: (items) {
          return _PostsList(
            posts: items,
            onRefresh: _onRefresh,
            onPostTap: (post) => _onPostTap(context, post.id),
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
    await ref.read(postsListProvider.notifier).refresh();
  }

  void _onPostTap(BuildContext context, int postId) {
    context.pushNamed(
      PostDetailsScreen.name,
      pathParameters: AppRouter.postDetailsParameters(postId),
    );
  }
}

class _PostsList extends StatelessWidget {
  const _PostsList({
    super.key,
    required this.posts,
    required this.onRefresh,
    required this.onPostTap,
  });

  final List<Post> posts;
  final Future<void> Function() onRefresh;
  final Function(Post) onPostTap;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
            onTap: () => onPostTap(post),
          );
        },
      ),
    );
  }
}
