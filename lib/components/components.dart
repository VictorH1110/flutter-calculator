import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.border = 0,
      this.fontSize = 15});
  final Widget child;
  final double border;
  final double fontSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border),
              ),
            ),
            textStyle:
                MaterialStateProperty.all(TextStyle(fontSize: fontSize))),
        child: child);
  }
}
