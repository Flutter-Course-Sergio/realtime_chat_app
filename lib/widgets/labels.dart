import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String label1;
  final String label2;

  const Labels(
      {super.key,
      required this.route,
      required this.label1,
      required this.label2});

  @override
  Widget build(BuildContext context) {
    const textStyleLabel = TextStyle(
        color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300);

    TextStyle textStyleButton = TextStyle(
        color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold);

    return Column(
      children: [
        Text(label1, style: textStyleLabel),
        TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, route);
            },
            child: Text(
              label2,
              style: textStyleButton,
            ))
      ],
    );
  }
}
