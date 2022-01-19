import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
      child: Divider(
        color: AppColor.dividerColor,
        thickness: 0.25,
      ),
    );
  }
}
