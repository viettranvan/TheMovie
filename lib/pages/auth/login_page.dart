import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/validation/validation.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = true;

  String errorMessage = '';

  void onLogin() async {
    String email = _emailController.text;
    String pass = _passwordController.text;

    if (email.isEmpty) {
      if (pass.isEmpty) {
        setState(() {
          errorMessage = 'Email is required!\nPassword is required!';
        });
      } else {
        setState(() {
          errorMessage = 'Email is required!';
        });
      }
    } else {
      if (pass.isEmpty) {
        setState(() {
          errorMessage = 'Password is required!';
        });
      } else {
        bool validEmail = Validation().validatorEmail(email);
        if (!validEmail) {
          setState(() {
            errorMessage = 'Incorrect email format';
          });
        } else {
          setState(() {
            errorMessage = '';
          });

          try {
            FirebaseAuth _auth = FirebaseAuth.instance;
            print('vao dc day');
            await _auth.signInWithEmailAndPassword(
                email: email, password: pass);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainPage())
              );
          } catch (e) {
            print('error: $e');
          }
        }
      }
    }

    print('email: $email\npass: $pass');
  }

  @override
  Widget build(BuildContext context) {
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
                  ErrorMessageBox(message: errorMessage),
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
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                              obscureText = !obscureText;
                            }),
                        child: Icon(
                          obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColor.blur,
                        )),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage())),
                        child: const Text(
                          'Forgot password?',
                          style: kTextSize20w400Blue,
                        ),
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
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage())),
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
