import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPref {
  String userId;
  SharedPref({Key key, this.userId});
}

Future<bool> saveUserId(String userId, String status) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("userId", userId);
  pref.setString("status", status);
  
  return pref.commit();
}

Future<String> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString("userId");

  return userId;
}

Future<String> getLoginStatus() async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  String status =pref.getString("status");

  return status;
}

Future clearPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}