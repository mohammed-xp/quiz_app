import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/utils/widgets/custom_text_button.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/quiz_view_body.dart';
import 'package:quiz_app/features/welcome/presentation/views/widgets/custom_app_bar.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        context,
        text: 'Skip',
        onPressed: () {},
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: const SafeArea(child: QuizViewBody()),
      ),
    );
  }
}
