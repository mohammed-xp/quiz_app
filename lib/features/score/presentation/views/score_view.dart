import 'package:flutter/material.dart';
import 'package:quiz_app/features/score/presentation/views/widgets/score_view_body.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: const SafeArea(child: ScoreViewBody(),),
      ),
    );
  }
}
