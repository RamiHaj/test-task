import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/core/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget prefix;
  final Widget? suffix;
  final String? hintText;
  final bool obscureText;

  const CustomTextForm(
      {Key? key,
      required this.textEditingController,
      this.onPressed,
      this.validator,
      required this.textInputType,
      required this.textInputAction,
      this.obscureText = false,
      required this.prefix,
      this.suffix,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onPressed,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: CustomColors.amber,
            ),
          ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
        )

      ),
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: TextStyle(color: CustomColors.black),
      cursorColor: CustomColors.black,
      obscureText: obscureText,

    );
  }
}
