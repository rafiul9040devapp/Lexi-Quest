import 'package:go_router/go_router.dart';
import 'package:lexi_quest/features/game/presentation/page/game_page.dart';
import 'package:lexi_quest/features/home/presentation/home_page.dart';

class AppRouter {
  static var router = GoRouter(
    initialLocation: HomePage.route,
    routes: [
      GoRoute(path: HomePage.route, builder: (context, state) => const HomePage()),
      GoRoute(path: '/game', builder: (context, state) =>  GamePage(
        attemptsCount: int.parse(state.uri.queryParameters['attemptsCount'] ?? ''),
        wordLength: int.parse(state.uri.queryParameters['wordLength'] ?? ''),
      )),
    ],
  );
}
