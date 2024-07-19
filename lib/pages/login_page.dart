import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyleLabel = TextStyle(
        color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w200);

    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(
                    title: 'Messenger',
                  ),
                  _Form(),
                  const Labels(
                    route: 'register',
                    label1: '¿No tienes una cuenta?',
                    label2: '¡Crea una ahora!',
                  ),
                  const Text(
                    'Terminos y condiciones de uso',
                    style: textStyleLabel,
                  ),
                ],
              ),
            ),
          ),
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
    final authService = Provider.of<AuthService>(context);

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
            onPressed: authService.isAuthenticating
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    await authService
                        .login(emailController.text.trim(),
                            passwordController.text.trim())
                        .then((login) => {
                              if (login)
                                {
                                  Navigator.pushReplacementNamed(
                                      context, 'users')
                                }
                              else
                                {
                                  showAlert(context, 'Login Error',
                                      'Revise sus credenciales')
                                }
                            });
                  },
          )
        ],
      ),
    );
  }
}
