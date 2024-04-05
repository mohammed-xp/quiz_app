
import 'package:go_router/go_router.dart';
import 'package:quiz_app/features/welcome/presentation/views/welcome_view.dart';

abstract class AppRouter{



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeView(),
      ),
    ],
  );
}