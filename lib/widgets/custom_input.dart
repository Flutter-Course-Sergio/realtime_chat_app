import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData prefixIcon;
  final String hintText;

  const CustomInput(
      {super.key,
      required this.keyboardType,
      required this.obscureText,
      required this.prefixIcon,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.blueAccent.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText),
      ),
    );
  }
}
