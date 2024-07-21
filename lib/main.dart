import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'global/environment.dart';
import 'routes/routes.dart';
import 'services/services.dart';

void main() async {
  const isPrd = bool.fromEnvironment("dart.vm.product");

  if (isPrd) {
    await Environment.initPrdEnvironment();
  } else {
    await Environment.initLocalEnvironment();
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(
          create: (_) => ChatService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
