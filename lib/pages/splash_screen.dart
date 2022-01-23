import 'package:flutter/material.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/services/services.dart';
import 'package:the_movie/values/values.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    HelperSharedPreferences.getLogin().then((value) {
      isLogin = value ?? false;
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          Center(
              child: Text('THE MOVIE',
                  style: kTextSize30w400White.copyWith(
                      fontWeight: FontWeight.bold))),
          Center(
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: Image.asset(
                'assets/images/themovie_app_icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
              child: Text('Welcome to the Movie App',
                  style: kTextSize30w400White.copyWith(
                      fontWeight: FontWeight.bold))),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 50.0,
            width: 50.0,
            child: Image.asset(
              'assets/images/image_placeholder.gif',
              fit: BoxFit.cover,
            ),
          ),
          FutureBuilder(
            future: HelperSharedPreferences.getExpirationTime().then((value) {
              int timeNow = DateTime.now().millisecondsSinceEpoch;
              Future.delayed(const Duration(seconds: 3)).then((_) {
                if (value != null &&
                    value >= timeNow &&
                    isLogin &&
                    value != -1) {
                  Navigator.pushReplacementNamed(context, MainPage.id);
                } else {
                  Navigator.pushReplacementNamed(context, LoginPage.id);
                }
              });
            }),
            builder: (context, snapshot) => const SizedBox(),
          ),
        ],
      ),
    );
  }
}
