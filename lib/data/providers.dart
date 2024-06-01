import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers.dart';
import '../domain/posts_repository.dart';
import 'comments_service.dart';
import 'posts_repository_impl.dart';
import 'posts_service.dart';

final postsServiceProvider = Provider<PostsService>(
  (ref) => PostsService(dio: ref.watch(dioProvider)),
);

final commentsServiceProvider = Provider<CommentsService>(
  (ref) => CommentsService(dio: ref.watch(dioProvider)),
);

final postsRepositoryProvider = Provider<PostsRepository>(
  (ref) => PostsRepositoryImpl(
    postsService: ref.watch(postsServiceProvider),
    commentsService: ref.watch(commentsServiceProvider),
  ),
);
