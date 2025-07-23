import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  late SharedPreferences _prefs;

  factory AppPreferences() {
    return _instance;
  }

  AppPreferences._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

   Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  dynamic getData(String key) {
    return _prefs.get(key);
  }

  Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }

  Future<void> saveModel<T>(
      String key, T model, Map<String, dynamic> Function(T) toJson) async {
    final String jsonString = jsonEncode(toJson(model));
    await _prefs.setString(key, jsonString);
  }

  T? getModel<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

  Future<void> saveModels<T>(String key, List<T> models,
      Map<String, dynamic> Function(T) toJson) async {
    final List<String> jsonList =
        models.map((model) => jsonEncode(toJson(model))).toList();
    await _prefs.setStringList(key, jsonList);
  }

  List<T> getModels<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final List<String>? jsonList = _prefs.getStringList(key);
    if (jsonList != null) {
      return jsonList.map((json) => fromJson(jsonDecode(json))).toList();
    }
    return [];
  }

  Future<void> clearExceptCredentials() async {
    // حفظ بيانات تسجيل الدخول قبل الحذف
    String? savedEmail = _prefs.getString('saved_email');
    String? savedPassword = _prefs.getString('saved_password');
    bool? rememberMe = _prefs.getBool('remember_me');

    await _prefs.clear();

    await _prefs.setString('saved_email', savedEmail!);
    await _prefs.setString('saved_password', savedPassword!);
    await _prefs.setBool('remember_me', rememberMe!);
  }

  bool isLoggedInUser() {
    return _prefs.containsKey("userModel");
  }

  // set secure data

/// Saves a value securely using FlutterSecureStorage.
  /// [key] is the identifier for the value.
  /// [value] is the value to be stored securely.
 static Future<void> setSecureData(String key, String value) async {
    const secureStorage = FlutterSecureStorage();
    debugPrint("Saving secure data for key: $key with value: $value");
    await secureStorage.write(key: key, value: value);
  }

  /// Retrieves a securely stored value using FlutterSecureStorage.
  /// [key] is the identifier for the value.
  /// Returns the value if found, or null if not found.
static Future<String?> getSecureData(String key) async {
    const secureStorage = FlutterSecureStorage();
    debugPrint("Getting secure data for key: $key");
    return await secureStorage.read(key: key) ?? "";
  }
static Future<void> removeSecureData(String key) async {
    const secureStorage = FlutterSecureStorage();
    debugPrint("Removing secure data for key: $key");
    await secureStorage.delete(key: key);
  }
}
