import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TheMovieApp());
}

class TheMovieApp extends StatelessWidget {
  const TheMovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        fontFamily: "Lato",
          scaffoldBackgroundColor: AppColor.background

      ),
      home: const LoginPage(),
    );
  }
}

