import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkingManager {
  final catNotifier = ValueNotifier('');

  Future<void> getRequest() async {
    final uri = Uri.parse('https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/eur.json');
    final response = await get(uri);
    print(response.statusCode);

    final jsonString = response.body;
    final map = jsonDecode(jsonString);

    catNotifier.value = map['eur']['mnt'].toString();
  }

  Future<void> postRequest() async {}
}