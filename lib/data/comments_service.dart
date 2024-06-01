import 'package:dio/dio.dart';

import '../domain/comment.dart';

class CommentsService {
  final Dio dio;

  CommentsService({required this.dio});

  Future<List<Comment>> getCommentsForPost(int postId) async {
    final response = await dio.get('/comments?postId=$postId');
    return List<Map<String, dynamic>>.from(response.data)
        .map((item) => Comment.fromJson(item))
        .toList();
  }
}
