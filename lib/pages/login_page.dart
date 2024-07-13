import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyleLabel = TextStyle(
        color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w200);

    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Logo(),
            _Form(),
            _Labels(),
            const Text(
              'Terminos y condiciones de uso',
              style: textStyleLabel,
            ),
          ],
        ));
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);

    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 50),
          width: 170,
          child: SafeArea(
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

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: null,
          )
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
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
