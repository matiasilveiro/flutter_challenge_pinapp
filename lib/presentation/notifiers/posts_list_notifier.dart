import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/post.dart';
import '../../domain/posts_repository.dart';

class PostsListNotifier extends AsyncNotifier<List<Post>> {
  late final PostsRepository postsRepository =
      ref.read(postsRepositoryProvider);

  @override
  FutureOr<List<Post>> build() async {
    return postsRepository.getPosts();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => postsRepository.getPosts());
  }
}

// We could use a plain FutureProvider instead of an AsyncValueNotifier to achieve the same result.
// But using an AsyncValueNotifier we follow the MVVM pattern like in the post details screen.
