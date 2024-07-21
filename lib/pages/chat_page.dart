import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  late ChatService chatService;
  late SocketService socketService;
  late AuthService authService;

  List<ChatMessage> messages = [];
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    const avatarTextStyle = TextStyle(fontSize: 12);
    const usernameTextStyle = TextStyle(color: Colors.black54, fontSize: 16);
    final userFor = chatService.userFor;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                child:
                    Text(userFor.name.substring(0, 2), style: avatarTextStyle),
              ),
              const SizedBox(width: 10),
              Text(
                userFor.name,
                style: usernameTextStyle,
              )
            ],
          ),
        ),
        body: Column(
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
    if (message.isEmpty) return;

    textController.clear();
    focusNode.requestFocus();

    final newMessage = ChatMessage(
      message: message,
      id: '123',
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)),
    );
    messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      isTyping = false;
    });

    socketService.emit('private-msg', {
      'from': authService.user.uid,
      'to': chatService.userFor.uid,
      'message': message
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
