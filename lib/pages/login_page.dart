import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

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
            const Logo(),
            _Form(),
            const Labels(),
            const Text(
              'Terminos y condiciones de uso',
              style: textStyleLabel,
            ),
          ],
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            prefixIcon: Icons.email_outlined,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          CustomInput(
            prefixIcon: Icons.lock_outlined,
            hintText: 'Contraseña',
            obscureText: true,
            textController: passwordController,
          ),
          BlueButton(
            buttonText: 'Ingrese',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
