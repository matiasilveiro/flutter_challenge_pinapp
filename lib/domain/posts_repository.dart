import 'comment.dart';
import 'post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
}
