import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/posts_repository.dart';
import '../states/post_details_state.dart';

class PostDetailsNotifier
    extends AutoDisposeFamilyNotifier<PostDetailsState, int?> {
  late final PostsRepository postsRepository =
      ref.read(postsRepositoryProvider);

  late final int? postId;

  @override
  PostDetailsState build(int? arg) {
    postId = arg;

    // If an id is passed, fetch the data from the repository
    if (postId != null) {
      _getPost(postId!);
      _getPostComments(postId!);

      return PostDetailsState(
        post: const AsyncValue.loading(),
        comments: const AsyncValue.loading(),
      );
    }

    return PostDetailsState();
  }

  Future<void> refresh() async {
    state = state.copyWith(
      comments: const AsyncValue.loading(),
    );

    return Future.wait([
      _getPost(postId!),
      _getPostComments(postId!),
    ]).then((_) => null);
  }

  Future<void> _getPost(int postId) async {
    // Simulate a delay to show the refresh indicator for a little longer
    await Future.delayed(const Duration(seconds: 1));

    return AsyncValue.guard(() => postsRepository.getPost(postId)).then(
      (value) => value.when(
        data: (post) => state = state.copyWith(
          post: AsyncValue.data(post),
        ),
        loading: () => state = state.copyWith(
          post: const AsyncValue.loading(),
        ),
        error: (error, _) => state = state.copyWith(
          post: const AsyncValue.loading(),
        ),
      ),
    );
  }

  Future<void> _getPostComments(int postId) async {
    // Simulate a delay to show the refresh indicator for a little longer
    await Future.delayed(const Duration(seconds: 2));

    return AsyncValue.guard(() => postsRepository.getCommentsForPost(postId))
        .then(
      (value) => value.when(
        data: (comments) => state = state.copyWith(
          comments: AsyncValue.data(comments),
        ),
        loading: () => state = state.copyWith(
          comments: const AsyncValue.loading(),
        ),
        error: (error, _) => state = state.copyWith(
          comments: const AsyncValue.loading(),
        ),
      ),
    );
  }
}
