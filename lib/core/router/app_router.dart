import 'package:go_router/go_router.dart';
import 'package:lexi_quest/features/home/presentation/home_page.dart';

class AppRouter {
  static var router = GoRouter(
    initialLocation: HomePage.route,
    routes: [
      GoRoute(path: HomePage.route, builder: (context, state) => const HomePage())
    ],
  );
}
