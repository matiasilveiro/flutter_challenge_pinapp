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

}
