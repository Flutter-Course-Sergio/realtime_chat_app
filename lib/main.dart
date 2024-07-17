import 'package:flutter/material.dart';
import 'package:realtime_chat_app/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}
