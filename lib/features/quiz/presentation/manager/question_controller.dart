import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/models/questions/questions_model.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

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

  int? _correctAns;
  int? get correctAns => _correctAns;

  int? _selectedAns;
  int? get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => _numberOfCorrectAns;

  void checkAns({
    required QuestionModel questionModel,
    required int selectedIndex,
  }) {
    _isAnswered = true;
    _correctAns = questionModel.answer;
    _selectedAns = selectedIndex;

    if(_correctAns == _selectedAns) {
      _numberOfCorrectAns++;
    }

    // It will stop the counter
    _animationController.stop();

    update();
  }

  @override
  void onInit() {
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
    _animationController.forward();

    super.onInit();
  }
}
