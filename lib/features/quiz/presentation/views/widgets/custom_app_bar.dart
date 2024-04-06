import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_text_button.dart';

AppBar CustomAppBar(
  BuildContext context, {
  required void Function()? onPressed,
  required String text,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    // leading: IconButton(
    //   icon: const Icon(Icons.arrow_back_ios),
    //   onPressed: () {
    //     GoRouter.of(context).pop();
    //   },
    // ),
    actions: [
      CustomTextButton(
        text: text,
        onPressed: onPressed,
      )
    ],
  );
}
