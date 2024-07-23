import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/models.dart';
import 'services.dart';

class ChatService with ChangeNotifier {
  late User userFor;

  Future<List<Message>> getChat(String userId) async {
    final token = await AuthService.getToken();
    final url = Uri.https(Environment.apiUrl, "/api/messages/$userId");

    final resp = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (resp.statusCode == 200) {
      final messagesResponse = messagesResponseFromJson(resp.body);
      return messagesResponse.messages;
    }

    return [];
  }
}
