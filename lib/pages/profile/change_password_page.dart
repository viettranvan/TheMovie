import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool obscureTextCurrent = true;
  bool obscureTextNew = true;
  bool obscureTextConfirm = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    obscureText: obscureTextCurrent,
                    textInputAction: TextInputAction.next,
                    suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                              obscureTextCurrent = !obscureTextCurrent;
                            }),
                        child: Icon(
                          obscureTextCurrent
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColor.blur,
                        ))),
                const SizedBox(height: 20.0),
                const Text('New Password', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                    controller: _newController,
                    hintText: 'Enter your new Password',
                    obscureText: obscureTextNew,
                    textInputAction: TextInputAction.next,
                    suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                              obscureTextNew = !obscureTextNew;
                            }),
                        child: Icon(
                          obscureTextNew
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColor.blur,
                        ))),
                const SizedBox(height: 20.0),
                const Text('Confirm Password', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                    controller: _confirmController,
                    hintText: 'Confirm Password',
                    obscureText: obscureTextConfirm,
                    textInputAction: TextInputAction.done,
                    suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                              obscureTextConfirm = !obscureTextConfirm;
                            }),
                        child: Icon(
                          obscureTextConfirm
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColor.blur,
                        ))),
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
