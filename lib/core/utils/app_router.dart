//
// import 'package:go_router/go_router.dart';
// import 'package:quiz_app/features/quiz/presentation/views/quiz_view.dart';
// import 'package:quiz_app/features/score/presentation/views/score_view.dart';
// import 'package:quiz_app/features/welcome/presentation/views/welcome_view.dart';
//
// abstract class AppRouter{
//
//   static const String kQuizView = '/quizView';
//   static const String kScoreView = '/scoreView';
//
//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const WelcomeView(),
//       ),
//       GoRoute(
//         path: kQuizView,
//         builder: (context, state) => const QuizView(),
//       ),
//
//       GoRoute(
//         path: kScoreView,
//         builder: (context, state) => const ScoreView(),
//       ),
//     ],
//   );
// }