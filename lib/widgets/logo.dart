import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);

    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 50),
          width: 170,
          child: Column(
            children: [
              const Image(image: AssetImage('assets/tag-logo.png')),
              const SizedBox(height: 20),
              Text(
                title,
                style: textStyle,
              )
            ],
          )),
    );
  }
}
