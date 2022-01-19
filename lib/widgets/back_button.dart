import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Icon(Icons.arrow_back,size: 30.0,color: AppColor.white),
      backgroundColor: AppColor.blur,
    );
  }
}
