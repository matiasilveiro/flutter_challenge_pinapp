import 'package:dio/dio.dart';

import '../domain/post.dart';

class PostsService {
  final Dio dio;

  PostsService({required this.dio});

  Future<List<Post>> getPosts() async {
    final response = await dio.get('/posts');
    return List<Map<String, dynamic>>.from(response.data)
        .map((item) => Post.fromJson(item))
        .toList();
  }

  Future<Post?> getPost(int postId) async {
    final response = await dio.get('/posts/$postId');
    return Post.fromJson(response.data);
  }
}
