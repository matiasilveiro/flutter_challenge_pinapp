import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../domain/comment.dart';

class CommentsService {
  // Used on non-iOS devices
  final Dio dio;

  // Used only on iOS
  final _methodChannel = const MethodChannel('challenge.pinapp/comments');

  CommentsService({required this.dio});

  Future<List<Comment>> getCommentsForPost(int postId) async {
    if (Platform.isIOS) {
      final nativeResponse = await _methodChannel.invokeMethod(
        'getCommentsForPost',
        postId,
      );
      final payload = jsonDecode(nativeResponse.toString());
      return List<Map<String, dynamic>>.from(payload)
          .map((item) => Comment.fromJson(item))
          .toList();
    } else {
      final response = await dio.get('/comments?postId=$postId');
      return List<Map<String, dynamic>>.from(response.data)
          .map((item) => Comment.fromJson(item))
          .toList();
    }
  }
}
