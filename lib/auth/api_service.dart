import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/api_models.dart';

class ApiService {
  Future<LoginModel> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse(
        'https://fly-manager-dev-api.azurewebsites.net/api/Account/login',

    );
    var res = await http.post(url, body: param,
    headers: {
      'accept' : '*/*',
      'Content-Type' : 'application/json-patch+json',
    }
    );
    debugPrint('res status: ${res.statusCode}');
    debugPrint('res status: ${res.body}');
    final data = jsonDecode(res.body);
    return LoginModel(token: data['accessToken'], error: data['error']);
  }
}
