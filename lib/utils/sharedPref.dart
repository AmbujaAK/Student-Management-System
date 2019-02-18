import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPref {
  String userId;
  SharedPref({Key key, this.userId});
}

Future<bool> saveUserId(String userId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("userId", userId);
  
  return pref.commit();
}

Future<String> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString("userId");

  return userId;
}