import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://10.0.2.2:3000/api/";

  static addUser(Map pdata) async {
    print(pdata);
    var url = Uri.parse(baseUrl + "add_user");
    try {
      final res = await http.post(url, body: pdata);

      if(res.statusCode == 200) {
        
        var data = jsonDecode(res.body.toString());
        print(data);

      } else {
        print("Failed to add user DATA");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
