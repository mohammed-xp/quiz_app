import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/features/quiz/presentation/manager/question_controller.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/quiz_view_body.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/custom_app_bar.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        context,
        text: 'Skip',
        onPressed: _questionController.nextQuestion,
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
