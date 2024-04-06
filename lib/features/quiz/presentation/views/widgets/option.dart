import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/features/quiz/presentation/manager/question_controller.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.onPressed,
  });

  final String text;
  final int index;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return kGreenColor;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == kRedColor
              ? Icons.close_rounded
              : Icons.done_rounded;
        }

        return InkWell(
          onTap: onPressed,
          child: Container(
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: getTheRightColor(),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${index + 1} $text',
                  style: Styles.textStyle16.copyWith(
                    color: getTheRightColor(),
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: getTheRightColor(),
                    ),
                  ),
                  child: getTheRightColor() == kGrayColor
                      ? null
                      : Icon(
                          getTheRightIcon(),
                          size: 16,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
