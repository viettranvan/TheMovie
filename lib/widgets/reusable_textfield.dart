import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
    this.obscureText = false,
    required this.controller,
    this.textInputAction,
    this.keyboardType,
    this.enabled = true,
    this.hintText,
    this.suffixIcon

  }) :  super(key: key);

  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool enabled;
  final String? hintText;
  final Widget? suffixIcon;



  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: kTextSize20w400White,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
        filled: true,
        fillColor: enabled ? AppColor.background :AppColor.blur.withOpacity(0.1),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: AppColor.blur),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintStyle: kTextSize20w400Blur,
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15.0),
        focusColor: AppColor.yellow,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: AppColor.white),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
