import 'package:flutter_challenge_pinapp/domain/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromJson creates a Post object from a valid JSON', () {
    // Given
    final jsonPost = {
      'id': 1,
      'userId': 1,
      'title': 'Post',
      'body': 'This is the body of the post',
    };

    // When
    final post = Post.fromJson(jsonPost);

    // Then
    expect(post.id, 1);
    expect(post.userId, 1);
    expect(post.title, 'Post');
    expect(post.body, 'This is the body of the post');
  });
}
