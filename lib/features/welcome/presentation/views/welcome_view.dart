import 'package:flutter/material.dart';
import 'package:quiz_app/features/welcome/presentation/views/widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: const SafeArea(
          child: WelcomeViewBody(),
        ),
      ),
    );
  }
}
