import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/posts_repository.dart';
import '../states/post_details_state.dart';

class PostDetailsNotifier
    extends AutoDisposeFamilyNotifier<PostDetailsState, int?> {
  late final PostsRepository postsRepository =
      ref.read(postsRepositoryProvider);

  @override
  PostDetailsState build(int? arg) {
    // If an id is passed, fetch the data from the repository
    if (arg != null) {
      _getPost(arg);
      _getPostComments(arg);
    }

    return PostDetailsState();
  }

  // TODO - Fix this
  Future<void> _getPost(int postId) {
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

  Future<void> _getPostComments(int postId) {
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
