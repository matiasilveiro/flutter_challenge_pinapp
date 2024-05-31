import 'comment.dart';
import 'post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
  Future<Post?> getPost(int postId);
  Future<List<Comment>> getCommentsForPost(int postId);
}
