import '../domain/comment.dart';
import '../domain/post.dart';
import '../domain/posts_repository.dart';
import 'comments_service.dart';
import 'posts_service.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsService postsService;
  final CommentsService commentsService;

  PostsRepositoryImpl({
    required this.postsService,
    required this.commentsService,
  });

  @override
  Future<List<Post>> getPosts() {
    return postsService.getPosts();
  }

  @override
  Future<Post?> getPost(int postId) {
    return postsService.getPost(postId);
  }

  @override
  Future<List<Comment>> getCommentsForPost(int postId) {
    return commentsService.getCommentsForPost(postId);
  }
}
