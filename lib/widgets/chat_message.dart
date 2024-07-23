import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String id;
  final AnimationController animationController;

  const ChatMessage(
      {super.key,
      required this.message,
      required this.id,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return FadeTransition(
        opacity: animationController,
        child: SizeTransition(
            sizeFactor: CurvedAnimation(
                parent: animationController, curve: Curves.easeOut),
            child: Container(
                child: id == authService.user.uid
                    ? _myMessage()
                    : _notMyMessage())));
  }

  Widget _myMessage() {
    const textStyle = TextStyle(color: Colors.white);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 10, bottom: 5, left: 50),
        decoration: BoxDecoration(
            color: const Color(0xff4d9ef6),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          message,
          style: textStyle,
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    const textStyle = TextStyle(color: Colors.black87);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(left: 10, bottom: 5, right: 50),
        decoration: BoxDecoration(
            color: const Color(0xffe4e5e8),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          message,
          style: textStyle,
        ),
      ),
    );
  }
}
