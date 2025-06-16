import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://10.0.2.2:3000/api/";

//POST API to add user
  static addUser(Map pdata) async {
    print(pdata);
    var url = Uri.parse(baseUrl + "add_user");
    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to add user DATA");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //GET API to get all users

  static getUser() async {
    List<User> users = [];

    var url = Uri.parse(baseUrl + "get_users");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);

        data['users']?.forEach((value) => {
              users.add(
                User(
                  name: value['name'],
                  email: value['email'],
                  phone: value['phone'],
                  id: value['_id'].toString(),
                ),
              )
            });
        return users;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


//UPDATE API to update user
static updateUser(id, body1) async {
  var url = Uri.parse(baseUrl + "update_user/$id");

  final res = await http.put(url, body: body1);

  if (res.statusCode == 200) {
    print(jsonDecode(res.body));
  }else {
    print("Failed to update user DATA");
  }
}


//DELETE API to delete user
  static deleteUser(id) async {
    var url = Uri.parse(baseUrl + "delete_user/$id");

    try{
    final res = await http.delete(url);

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to delete user DATA");
    }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


}
