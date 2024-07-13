import 'package:flutter/material.dart';

import '../pages/chat_page.dart';
import '../pages/loading_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'chat': (_) => const ChatPage(),
  'loading': (_) => const LoadingPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'users': (_) => const UsersPage(),
};
