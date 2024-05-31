import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/post.dart';
import 'posts_list_notifier.dart';

final postsListProvider =
    AsyncNotifierProvider<PostsListNotifier, List<Post>>(PostsListNotifier.new);
