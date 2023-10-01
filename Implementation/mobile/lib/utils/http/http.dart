import 'dart:convert';

import 'package:http/http.dart' as http;




Future<http.Response> RegisterRequest(String jsonBody) {
  return http.post(Uri.parse("http://192.168.1.38:8000/api/user/v1/register"), body: jsonBody, headers: <String, String>{"content-type": "application/json"});
}

Future<http.Response> LoginRequest(String jsonBody) {
  return http.post(Uri.parse("http://192.168.1.38:8000/api/login/v1"), body: jsonBody, headers: <String, String>{"content-type": "application/json"});
}