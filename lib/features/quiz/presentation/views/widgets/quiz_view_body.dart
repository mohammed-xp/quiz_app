import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/features/quiz/presentation/manager/question_controller.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/progress_bar.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/question_card.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ProgressBar(),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Obx(() =>Text.rich(
            TextSpan(
              text: 'Question ${_questionController.questionNumber}',
              style: Styles.textStyle34.copyWith(
                fontWeight: FontWeight.w400,
                color: kSecondaryColor,
              ),
              children: [
                TextSpan(
                  text: '/${_questionController.questions.length}',
                  style: Styles.textStyle24.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          )),
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _questionController.pageController,
            onPageChanged: _questionController.updateTheQnNum,
            itemCount: _questionController.questions.length,
            itemBuilder: (context, index) => QuestionCard(
              questionModel: _questionController.questions[index],
            ),
          ),
        ),
      ],
    );
  }
}
