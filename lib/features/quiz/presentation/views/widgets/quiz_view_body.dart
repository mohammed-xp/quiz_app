import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/core/utils/styles.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/progress_bar.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProgressBar(),
          const SizedBox(height: kDefaultPadding,),
          Text.rich(
            TextSpan(
              text: 'Question 1',
              style: Styles.textStyle34.copyWith(
                fontWeight: FontWeight.w400,
                color: kSecondaryColor,
              ),
              children: [
                TextSpan(
                  text: '/10',
                  style: Styles.textStyle24.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          const SizedBox(height: kDefaultPadding,),
        ],
      ),
    );
  }
}
