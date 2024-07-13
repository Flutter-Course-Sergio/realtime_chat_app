import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);

    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 50),
          width: 170,
          child: const SafeArea(
            child: Column(
              children: [
                Image(image: AssetImage('assets/tag-logo.png')),
                SizedBox(height: 20),
                Text(
                  'Messenger',
                  style: textStyle,
                )
              ],
            ),
          )),
    );
  }
}
