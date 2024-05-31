import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/comment.dart';
import '../../domain/post.dart';

class PostDetailsState {
  final AsyncValue<Post?> post;
  final AsyncValue<List<Comment>> comments;

  PostDetailsState({
    this.post = const AsyncValue.data(null),
    this.comments = const AsyncValue.data([]),
  });

  PostDetailsState copyWith({
    AsyncValue<Post?>? post,
    AsyncValue<List<Comment>>? comments,
  }) {
    return PostDetailsState(
      post: post ?? this.post,
      comments: comments ?? this.comments,
    );
  }
}
