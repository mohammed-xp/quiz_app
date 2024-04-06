import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/features/quiz/presentation/manager/question_controller.dart';

class ScoreViewBody extends StatelessWidget {
  const ScoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Column(
      children: [
        const Spacer(
          flex: 3,
        ),
        Text(
          'Score',
          style: Styles.textStyle44.copyWith(
            color: kSecondaryColor,
          ),
        ),
        const Spacer(),
        Text(
          '${questionController.correctAns * 10}/${questionController.questions.length * 10}',
          style: Styles.textStyle34.copyWith(
            color: kSecondaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
