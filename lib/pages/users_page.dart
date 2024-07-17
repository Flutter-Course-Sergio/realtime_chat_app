import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

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
        body: SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            onRefresh: _loadUsers,
            header: WaterDropHeader(
              complete: Icon(Icons.check, color: Colors.blue[400]),
              waterDropColor: Colors.blue,
            ),
            child: _listViewUsers()));
  }

  ListView _listViewUsers() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => _userListTile(users[i]),
        separatorBuilder: (_, i) => const Divider(),
        itemCount: users.length);
  }

  ListTile _userListTile(User user) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(user.name.substring(0, 2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green[300] : Colors.red[300],
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  _loadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
