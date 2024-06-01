import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/posts_repository.dart';
import 'fake_posts_repository.dart';

final postsRepositoryProvider = Provider<PostsRepository>(
  (ref) => FakePostsRepository(),
);
