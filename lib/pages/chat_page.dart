import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  List<ChatMessage> messages = [
    ChatMessage(id: '123', message: 'Hola mundo'),
    ChatMessage(id: '123', message: 'Hola mundo'),
    ChatMessage(id: '1231', message: 'Hola mundo'),
    ChatMessage(id: '123', message: 'Hola mundo'),
    ChatMessage(id: '1233', message: 'Hola mundo'),
    ChatMessage(id: '123', message: 'Hola mundo'),
  ];

  bool isTyping = false;

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
                itemCount: messages.length,
                itemBuilder: (_, i) => messages[i],
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
                setState(() {
                  isTyping = content.trim().isNotEmpty ? true : false;
                });
              },
              decoration:
                  const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: focusNode,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Platform.isIOS
                ? CupertinoButton(
                    onPressed: isTyping
                        ? () => _handleSubmit(textController.text.trim())
                        : null,
                    child: const Text('Enviar'),
                  )
                : IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: isTyping
                            ? () => _handleSubmit(textController.text.trim())
                            : null,
                        icon: const Icon(Icons.send)),
                  ),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String message) {    
    textController.clear();
    focusNode.requestFocus();

    final newMessage = ChatMessage(message: message, id: '123');
    messages.insert(0, newMessage);

    setState(() {
      isTyping = false;
    });
  }
}
