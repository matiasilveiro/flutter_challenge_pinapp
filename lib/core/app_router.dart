import 'package:go_router/go_router.dart';

import '../presentation/screens/screens.dart';

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

