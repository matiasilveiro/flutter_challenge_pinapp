import '../domain/comment.dart';
import '../domain/post.dart';
import '../domain/posts_repository.dart';

class FakePostsRepository implements PostsRepository {
  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Post(
        id: 1,
        userId: 1,
        title: 'Post 1',
        body: 'This is the body of post 1',
      ),
      Post(
        id: 2,
        userId: 1,
        title: 'Post 2',
        body: 'This is the body of post 2',
      ),
      Post(
        id: 3,
        userId: 1,
        title: 'Post 3',
        body: 'This is the body of post 3',
      ),
    ];
  }

  @override
  Future<List<Comment>> getCommentsForPost(int postId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Comment(
        id: 1,
        postId: postId,
        name: 'Name 1',
        email: 'email1@gmail.com',
        body: 'Comment 1 for post $postId',
      ),
      Comment(
        id: 2,
        postId: postId,
        name: 'Name 2',
        email: 'email1@gmail.com',
        body: 'Comment 2 for post $postId',
      ),
      Comment(
        id: 3,
        postId: postId,
        name: 'Name 3',
        email: 'email1@gmail.com',
        body: 'Comment 3 for post $postId',
      ),
    ];
  }

  @override
  Future<Post?> getPost(int postId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Post(
      id: postId,
      userId: 1,
      title: 'Post $postId',
      body: 'This is the body of post $postId',
    );
  }
}
