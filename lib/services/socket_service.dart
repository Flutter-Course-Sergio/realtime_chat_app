import 'package:flutter/material.dart';
import 'package:realtime_chat_app/global/environment.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'auth_service.dart';

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io.Socket _socket;

  void connect() async {
    final token = await AuthService.getToken();

    _socket = io.io("https://${Environment.apiUrl}/", {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'Authorization': 'Bearer $token'
      }
    });

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }

  ServerStatus get serverStatus => _serverStatus;
  io.Socket get socket => _socket;
  Function get emit => _socket.emit;
}
