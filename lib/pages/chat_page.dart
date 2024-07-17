import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    const avatarTextStyle = TextStyle(fontSize: 12);
    const usernameTextStyle = TextStyle(color: Colors.black54, fontSize: 16);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text('TE', style: avatarTextStyle),
              ),
              const SizedBox(width: 10),
              Text(
                'Abigail Amador',
                style: usernameTextStyle,
              )
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, i) => Text(i.toString()),
                reverse: true,
              )),
              const Divider(),
              Container(
                color: Colors.white,
                child: _inputChat(),
              )
            ],
          ),
        ));
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: textController,
              onSubmitted: _handleSubmit,
              onChanged: (String content) {
                // TODO: cuando hay un valor para poder postear
              },
              decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: focusNode,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS
                ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                : IconButton.filled(
                    onPressed: () {},
                    style: IconButton.styleFrom(backgroundColor: Colors.blue),
                    icon: const Icon(
                      Icons.send,
                    )),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String message) {
    print(message);
    textController.clear();
    focusNode.requestFocus();
  }
}
