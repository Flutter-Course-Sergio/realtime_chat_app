import 'package:flutter/material.dart';
import 'package:realtime_chat_app/models/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    User(online: true, email: 'test1@test.com', name: 'Abigail', id: '1'),
    User(online: true, email: 'test2@test.com', name: 'Sergio', id: '2'),
    User(online: false, email: 'test3@test.com', name: 'Karen', id: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black54);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mi nombre',
            style: textStyle,
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app_rounded,
                color: Colors.black54,
              )),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(Icons.check_circle, color: Colors.blue[400])
                //child: Icon(Icons.offline_bolt, color: Colors.red[400])
                )
          ],
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) => ListTile(
                  title: Text(users[i].name),
                  leading: CircleAvatar(
                    child: Text(users[i].name.substring(0, 2)),
                  ),
                  trailing: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: users[i].online
                            ? Colors.green[300]
                            : Colors.red[300],
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
            separatorBuilder: (_, i) => const Divider(),
            itemCount: users.length));
  }
}
