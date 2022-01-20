import 'package:flutter/material.dart';
import 'package:the_movie/pages/detail/movie_detail_page.dart';
import 'package:the_movie/pages/home/home_page.dart';
import 'package:the_movie/values/values.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}

