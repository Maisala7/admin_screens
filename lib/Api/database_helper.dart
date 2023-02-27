import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  var status;
  var loginEmailStatus, loginEmailStatus1, loginUsernameStatus;
  var token;
//1 login
  loginData(String username, String password) async {
    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'get_user_info/',
    );
    final response = await http
        .post(myUrl, body: {"username": "$username", "password": "$password"});
    status = response.body.contains('Incorrect username or password');
    var data = json.decode(response.body);
    if (status) {
    } else {
      _save(data);
    }
  }

  //2 user request
  Future<List> get_user_request() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = prefs.get(key) ?? '';

      Uri myUrl = Uri(
        scheme: 'http',
        host: 'maisala7.pythonanywhere.com',
        path: 'get_user_request/',
      );
      http.Response response = await http.get(myUrl, headers: {
        'Accept': 'application/json',
        'Authorization': 'token $value'
      });
      print('response.body >>>>>>>>>');
      print(response.body);
      return json.decode(response.body);
    } catch (_) {
      print('error >>>>');
      print(_);
      return [];
    }
  }

  //3 confirmation
  payment_confirmation(int process_number) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'Payment_confirmation/',
    );
    final response = http.post(myUrl, headers: {
      'Authorization': 'token $value'
    }, body: {
      "process_number": "$process_number",
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
    status = response.toString().contains('error');
  }

  //4 user details
  Future<List> get_user_details() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'get_user_datails/',
    );
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'token $value'
    });
    return json.decode(response.body);
  }

  //5 reports
  reports(int process_number) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    Uri myUrl = Uri(
      scheme: 'http',
      host: 'maisala7.pythonanywhere.com',
      path: 'show_my_report/',
    );
    final response = http.post(myUrl, headers: {
      'Authorization': 'token $value'
    }, body: {
      "process_number": "$process_number",
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
    status = response.toString().contains('error');
  }

  //accept? reject? wait?

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
}
