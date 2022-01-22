import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController _currentController = TextEditingController();
    final TextEditingController _newController = TextEditingController();
    final TextEditingController _confirmController = TextEditingController();

    final dialog = CustomDialog(
      title: 'Confirm Change Password',
      content: 'Are you want to change your password?',
      onSubmit: () {},
      hasTwoButton: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password', style: kTextSize28w500White),
        centerTitle: true,
        backgroundColor: AppColor.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0),
                const ErrorMessageBox(message: 'message'),
                const SizedBox(height: 20.0),
                const Text('Current Password', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                    controller: _currentController,
                    hintText: 'Enter your current Password',
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    suffixIcon: true,
                ),
                const SizedBox(height: 20.0),
                const Text('New Password', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                    controller: _newController,
                    hintText: 'Enter your new Password',
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    suffixIcon: true),
                const SizedBox(height: 20.0),
                const Text('Confirm Password', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                    controller: _confirmController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    suffixIcon: true),
                const SizedBox(height: 20.0),
                ReusableButton(
                  onTap: () => showDialog(
                      context: context, builder: (context) => dialog),
                  buttonTitle: 'Confirm',
                  buttonColor: AppColor.red,
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
