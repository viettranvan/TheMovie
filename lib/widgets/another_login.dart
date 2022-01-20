import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class AnotherLoginMethod extends StatelessWidget {
  const AnotherLoginMethod(
      {Key? key, required this.onGoggleLogin, required this.onFacebookLogin})
      : super(key: key);

  final Function()? onGoggleLogin;
  final Function()? onFacebookLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(
              child: HorizontalDivider(),
            ),
            Text('or', style: kTextSize20w400White),
            Expanded(
              child: HorizontalDivider(),
            ),
          ],
        ),
        GestureDetector(
          onTap: onGoggleLogin,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: AppColor.white25),
                color: AppColor.blur),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: Image.asset(
                    'assets/images/google.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15.0),
                const Text('Login with Google', style: kTextSize18w400White),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        GestureDetector(
          onTap: onFacebookLogin,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: AppColor.white25),
                color: AppColor.blur),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: Image.asset(
                    'assets/images/facebook.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15.0),
                const Text('Login with Facebook', style: kTextSize18w400White),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
