import 'package:flutter/material.dart';
import 'package:the_movie/values/app_styles.dart';


class DocumentaryView extends StatelessWidget {
  const DocumentaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: Center(
            child: Text('Documentary will be update soon!',style: kTextSize20w400White),
          ),
        ),
      ],
    );
  }
}
