import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/core/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key, this.onPressed, required this.child}) : super(key: key);
  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Center(child: child),
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(color: Colors.amber)
            )
        ),
    );
  }
}
