import 'package:flutter/material.dart';
import 'package:the_movie/pages/auth/login_page.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool obscureText = true;
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
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
                    child: Text('Register',
                        style: kTextSize30w400White.copyWith(
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 30.0),
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
                const Text('Confirm Password', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                  hintText: 'Confirm Password',
                  controller: _confirmController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: obscureTextConfirm,
                  suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                            obscureTextConfirm = !obscureTextConfirm;
                          }),
                      child: Icon(
                        obscureTextConfirm
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColor.blur,
                      )),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                ReusableButton(
                  onTap: () {},
                  buttonTitle: 'Register',
                  buttonColor: AppColor.red,
                ),
                const SizedBox(height: 20.0),
                AnotherLoginMethod(
                  onGoggleLogin: () => print('Login google'),
                  onFacebookLogin: () {},
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Wrap(
                    children: [
                      const Text('Already have an account?',
                          style: kTextSize18w400White),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const LoginPage())
                          ),
                          child:
                              const Text('Sign In', style: kTextSize18w400Red)),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
