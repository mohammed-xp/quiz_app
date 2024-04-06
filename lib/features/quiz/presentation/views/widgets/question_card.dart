import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/features/quiz/presentation/manager/question_controller.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/questions/questions_model.dart';
import '../../../../../core/utils/styles.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.questionModel,
  });

  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    final QuestionController _questionController =
        Get.put(QuestionController());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            questionModel.question ?? '----',
            style: Styles.textStyle20.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
            questionModel.options?.length ?? 0,
            (index) => Option(
              text: questionModel.options![index],
              index: index,
              onPressed: () {
                _questionController.checkAns(
                  questionModel: questionModel,
                  selectedIndex: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
