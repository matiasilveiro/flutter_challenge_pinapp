import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_router.dart';
import '../../domain/post.dart';
import '../notifiers/providers.dart';
import '../widgets/post_item.dart';
import 'post_details_screen.dart';

class PostsListScreen extends ConsumerStatefulWidget {
  static const name = 'PostsListScreen';

  const PostsListScreen({super.key});

  @override
  ConsumerState<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends ConsumerState<PostsListScreen> {
  //Back to top botton will show on scroll offset 10.0
  static const double _showOffset = 10.0;

  final ScrollController _scrollController = ScrollController();
  bool _showReturnToTopButton = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScrolled);
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipycode Posts'),
      ),
      body: posts.when(
        data: (items) {
          return _PostsList(
            posts: items,
            controller: _scrollController,
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
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _showReturnToTopButton ? 1.0 : 0.0,
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  void _onScrolled() {
    final shouldShowButton = _scrollController.offset > _showOffset;

    // Only update the state if the value has changed to avoid unnecessary rebuilds
    if (shouldShowButton != _showReturnToTopButton) {
      setState(() {
        _showReturnToTopButton = shouldShowButton;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
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
    this.controller,
  });

  final List<Post> posts;
  final Future<void> Function() onRefresh;
  final Function(Post) onPostTap;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: CupertinoScrollbar(
        controller: controller,
        child: ListView.separated(
          controller: controller,
          itemCount: posts.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostItem(
              post: post,
              onPostTap: onPostTap,
            );
          },
        ),
      ),
    );
  }
}
