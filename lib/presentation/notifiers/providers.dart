import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/post.dart';
import '../states/post_details_state.dart';
import 'post_details_notifier.dart';
import 'posts_list_notifier.dart';

final postsListProvider =
    AsyncNotifierProvider<PostsListNotifier, List<Post>>(PostsListNotifier.new);

final postDetailsProvider = AutoDisposeNotifierProviderFamily<
    PostDetailsNotifier, PostDetailsState, int?>(PostDetailsNotifier.new);
