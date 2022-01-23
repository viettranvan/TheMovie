import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/blocs.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    void onLogin() {
      String email = _emailController.text;
      String password = _passwordController.text;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const LoadingDialog(),
      );

      BlocProvider.of<LoginBloc>(context)
          .add(SendLoginRequest(email: email, password: password));
    }

    void gotoSignUp() {
      Navigator.of(context).pushNamed(SignUpPage.id);
    }

    void gotoForgotPassword() {
      Navigator.of(context).pushNamed(ForgotPasswordPage.id);
    }

    void gotoMainPage() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, MainPage.id);
      });
    }

    void gotoVerifyPage() {
      WidgetsBinding.instance!.addPostFrameCallback((_){
        Navigator.pushNamedAndRemoveUntil(context,VerifyEmail.id,(Route<dynamic> route) => false);
      });
    }

    return Scaffold(
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text('Login',
                          style: kTextSize30w400White.copyWith(
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 20.0),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case LoginFailure:
                          Navigator.maybePop(context);
                          return ErrorMessageBox(
                              message: (state as LoginFailure).errorMessage);
                        case EmailIsNotVerify:
                          Future.delayed(Duration.zero).then((_) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => CustomDialog(
                                    title: 'Verify Email',
                                    content:
                                        'Your account is not verified yet. Verify now!',
                                    onSubmit: () => gotoVerifyPage()));
                          });
                          return const SizedBox();

                        case LoginSuccess:
                          Navigator.maybePop(context);
                          // gotoMainPage();
                          break;
                        default:
                          return const SizedBox();
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Email', style: kTextSize20w400White),
                  const SizedBox(height: 10.0),
                  ReusableTextField(
                    hintText: 'Enter your Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Password', style: kTextSize20w400White),
                  const SizedBox(height: 10.0),
                  ReusableTextField(
                    hintText: 'Enter your Password',
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    suffixIcon: true,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () => gotoForgotPassword(),
                        child: const Text('Forgot password?',
                            style: kTextSize20w400Blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ReusableButton(
                    onTap: () => onLogin(),
                    buttonTitle: 'Login',
                    buttonColor: AppColor.red,
                  ),
                  const SizedBox(height: 20.0),
                  AnotherLoginMethod(
                    onGoggleLogin: () {},
                    onFacebookLogin: () {},
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Wrap(
                      children: [
                        const Text('Don\'t have an account?',
                            style: kTextSize18w400White),
                        const SizedBox(width: 10.0),
                        GestureDetector(
                            onTap: () => gotoSignUp(),
                            child: const Text('Sign Up',
                                style: kTextSize18w400Red)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
