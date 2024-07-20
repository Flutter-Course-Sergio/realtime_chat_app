import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../widgets/widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(child: CustomLoader());
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    await authService.isTokenValid().then((auth) => {
          if (auth)
            {
              socketService.connect(),
              Navigator.pushReplacementNamed(context, 'users')
            }
          else
            {Navigator.pushReplacementNamed(context, 'login')}
        });
  }
}
