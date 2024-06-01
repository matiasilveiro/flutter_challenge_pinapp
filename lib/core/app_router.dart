import 'package:go_router/go_router.dart';

import '../presentation/screens/post_details_screen.dart';
import '../presentation/screens/posts_list_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: PostsListScreen.name,
      builder: (context, state) => const PostsListScreen(),
    ),
    GoRoute(
      path: '/posts/:id',
      name: PostDetailsScreen.name,
      builder: (context, state) => PostDetailsScreen(
        postId: int.tryParse(state.pathParameters['id'] ?? '') ?? -1,
      ),
    ),
  ],
);

class AppRouter {
  // Path parameters for the PostDetailsScreen route.
  // The postId is required to fetch the note details.
  static Map<String, String> postDetailsParameters(int postId) {
    return {'id': postId.toString()};
  }
}
