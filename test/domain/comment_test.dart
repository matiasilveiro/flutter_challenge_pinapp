import 'package:flutter_challenge_pinapp/domain/comment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromJson creates a Comment object from a valid JSON', () {
    // Given
    final jsonComment = {
      'id': 1,
      'postId': 1,
      'name': 'Name',
      'email': 'email@gmail.com',
      'body': 'Comment',
    };

    // When
    final comment = Comment.fromJson(jsonComment);

    // Then
    expect(comment.id, 1);
    expect(comment.postId, 1);
    expect(comment.name, 'Name');
    expect(comment.email, 'email@gmail.com');
    expect(comment.body, 'Comment');
  });
}
