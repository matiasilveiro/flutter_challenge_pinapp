import 'package:flutter_challenge_pinapp/data/comments_service.dart';
import 'package:flutter_challenge_pinapp/data/posts_repository_impl.dart';
import 'package:flutter_challenge_pinapp/data/posts_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/comments.dart';
import '../mocks/posts.dart';

class MockPostsService extends Mock implements PostsService {}

class MockCommentsService extends Mock implements CommentsService {}

void main() {
  final postsService = MockPostsService();
  final commentsService = MockCommentsService();
  final PostsRepositoryImpl postsRepository = PostsRepositoryImpl(
    postsService: postsService,
    commentsService: commentsService,
  );

  tearDown(() {
    reset(postsService);
    reset(commentsService);
  });

  test('getPosts returns a list of posts', () async {
    // Given
    when(() => postsService.getPosts())
        .thenAnswer((_) => Future.value(mockPosts));

    // When
    final posts = await postsRepository.getPosts();

    // Then
    expect(posts, isNotEmpty);
    expect(posts, mockPosts);

    verify(() => postsService.getPosts()).called(1);
    verifyNoMoreInteractions(postsService);
    verifyZeroInteractions(commentsService);
  });

  test('getPost returns a post', () async {
    // Given
    when(() => postsService.getPost(1))
        .thenAnswer((_) => Future.value(mockPosts[0]));

    // When
    final post = await postsRepository.getPost(1);

    // Then
    expect(post, isNotNull);
    expect(post, mockPosts[0]);

    verify(() => postsService.getPost(1)).called(1);
    verifyNoMoreInteractions(postsService);
    verifyZeroInteractions(commentsService);
  });

  test('getCommentsForPost returns a list of comments', () async {
    // Given
    when(() => commentsService.getCommentsForPost(1))
        .thenAnswer((_) => Future.value(mockComments));

    // When
    final comments = await postsRepository.getCommentsForPost(1);

    // Then
    expect(comments, isNotEmpty);
    expect(comments, mockComments);

    verify(() => commentsService.getCommentsForPost(1)).called(1);
    verifyNoMoreInteractions(commentsService);
    verifyZeroInteractions(postsService);
  });
}
