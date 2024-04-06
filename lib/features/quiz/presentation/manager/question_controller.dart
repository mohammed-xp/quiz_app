import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/features/score/presentation/views/score_view.dart';

import '../../../../core/models/questions/questions_model.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<QuestionModel> _questions = sample_data
      .map((q) => QuestionModel(
            id: q['id'],
            question: q['question'],
            options: q['options'],
            answer: q['answer_index'],
          ))
      .toList();
  List<QuestionModel> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  int? _selectedAns;
  int? get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  late int _numberOfCorrectAns ;
  int get numberOfCorrectAns => _numberOfCorrectAns;

  void checkAns({
    required QuestionModel questionModel,
    required int selectedIndex,
  }) {
    _isAnswered = true;
    _correctAns = questionModel.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numberOfCorrectAns++;
    }

    // It will stop the counter
    _animationController.stop();

    update();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        nextQuestion();
      },
    );
  }

  void nextQuestion({context}) {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once time is finish go to next question
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // GoRouter.of(context).pushReplacement(AppRouter.kScoreView);
      Get.offAll(const ScoreView());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  @override
  void onInit() {
    _numberOfCorrectAns = 0;
    _animationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        //update like setState
        update();
      });

    // start our animation
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    _animationController.dispose();
    _pageController.dispose();
  }
}
