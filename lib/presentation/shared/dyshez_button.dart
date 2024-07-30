import 'package:flutter/material.dart';

class DyshezButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final BorderSide borderSide;
  final Widget icon;
  final Color foregroundColor;

  const DyshezButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFE3026F),
    this.textColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(30.0)),
    this.padding = const EdgeInsets.symmetric(vertical: 18.0, horizontal: 28.0),
    this.borderSide = BorderSide.none,
    this.icon = const SizedBox(),
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50.0),
        side: borderSide,
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        foregroundColor: foregroundColor,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      icon: icon,
    );
  }
}
