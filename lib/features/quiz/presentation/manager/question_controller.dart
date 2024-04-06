import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  @override
  void onInit() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)..addListener(() {
      //update like setState
      update();
    });

    // start our animation
    _animationController.forward();

    super.onInit();
  }
}
