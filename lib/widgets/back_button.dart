import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: AppColor.grey,
        child: const Icon(Icons.arrow_back,size: 30.0,color: AppColor.white)
      ),

    );
  }
}
