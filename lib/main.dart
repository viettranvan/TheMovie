import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/blocs.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/repositories/repositories.dart';
import 'package:the_movie/values/values.dart';

import 'services/auth.dart';

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
          scaffoldBackgroundColor: AppColor.background),
      routes: {
        /// auth
        LoginPage.id: (context) => BlocProvider(
              create: (context) => LoginBloc(authService: AuthService()),
              child: const LoginPage(),
            ),
        SignUpPage.id: (context) => BlocProvider(
              create: (context) => SignUpBloc(authService: AuthService()),
              child: const SignUpPage(),
            ),
        ForgotPasswordPage.id: (context) => BlocProvider(
              create: (context) => ForgotPasswordBloc(
                authService: AuthService(),
              ),
              child: const ForgotPasswordPage(),
            ),
        VerifyEmail.id: (context) => const VerifyEmail(),

        /// detail
        MovieDetailPage.id: (context) => BlocProvider(
              create: (context) => MovieDetailBloc(DetailRepository()),
              child: const MovieDetailPage(),
            ),
        TVSeriesDetailPage.id: (context) => BlocProvider(
              create: (context) => TVSeriesDetailBloc(DetailRepository()),
              child: const TVSeriesDetailPage(),
            ),
        CastAndCrewPage.id: (context) => BlocProvider(
              create: (context) => CastAndCrewBloc(),
              child: const CastAndCrewPage(),
            ),
        CastDetailPage.id: (context) => const CastDetailPage(),
        CrewDetailPage.id: (context) => const CrewDetailPage(),

        ChangePasswordPage.id: (context) => BlocProvider(
              create: (context) => ProfileBloc(),
              child: const ChangePasswordPage(),
            ),
        MainPage.id: (context) => const MainPage(),
      },
      home:
          // const VerifyEmail()
          BlocProvider(
        create: (context) => LoginBloc(authService: AuthService()),
        child: const SplashScreen(),
      ),
    );
  }
}
