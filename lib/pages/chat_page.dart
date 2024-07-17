import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
                height: 100,
              )
            ],
          ),
        ));
  }
}
