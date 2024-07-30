import 'package:flutter/material.dart';

class DyshezInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData? inputIcon;
  final String? errorText;
  final String? Function(String?)? validator;

  const DyshezInput({
    super.key,
    required this.hintText,
    this.labelText = '',
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputIcon,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: inputIcon != null
              ? Icon(inputIcon, color: const Color(0xFF747474))
              : null,
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 1.0,
              color: Color(0xFFE7E7E9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 1.0,
              color: Color(0xFFE7E7E9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 1.0,
              color: Color(0xFFE7E7E9),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.red,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
        ),
      ),
    );
  }
}
