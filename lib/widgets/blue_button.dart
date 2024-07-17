import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;

  const BlueButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 17);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
              child: Text(
            buttonText,
            style: textStyle,
          ))),
    );
  }
}
