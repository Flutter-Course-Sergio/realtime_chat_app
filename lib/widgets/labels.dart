import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyleLabel = TextStyle(
        color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300);

    TextStyle textStyleButton = TextStyle(
        color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold);

    return Column(
      children: [
        const Text('¿No tienes una cuenta?', style: textStyleLabel),
        TextButton(
            onPressed: () {},
            child: Text(
              'Crea una ahora!',
              style: textStyleButton,
            ))
      ],
    );
  }
}
