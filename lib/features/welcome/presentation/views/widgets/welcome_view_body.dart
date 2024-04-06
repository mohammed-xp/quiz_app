import 'package:flutter/material.dart';
import 'package:quiz_app/features/welcome/presentation/views/widgets/custom_button.dart';
import 'package:quiz_app/features/welcome/presentation/views/widgets/custom_text_field.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          const Text(
            'Let\'s play quiz',
            style: Styles.textStyle34,
          ),
          const Text(
            'Enter your information below',
            // style: Styles.textStyle34,
          ),
          const Spacer(),
          const CustomTextField(
            hintText: 'Full Name',
          ),
          const Spacer(),
          CustomButton(
            text: 'Let\'s Start Quiz',
            onPressed: () {},
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
