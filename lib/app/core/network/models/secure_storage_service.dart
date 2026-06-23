import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:evoliving/app/features/authentication/data/models/response/login_response_model.dart';

class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _tokenKey = 'token';
  static const String _userKey = 'user';

  /// ================= TOKEN =================

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  /// ================= USER =================

  static Future<void> saveUser(LoginResponseModel user) async {
    final userJson = jsonEncode(user.toJson());
    await _storage.write(key: _userKey, value: userJson);
  }

  static Future<LoginResponseModel?> getUser() async {
    final userJson = await _storage.read(key: _userKey);

    if (userJson == null) return null;

    return LoginResponseModel.fromJson(jsonDecode(userJson));
  }

  static Future<void> deleteUser() async {
    await _storage.delete(key: _userKey);
  }

  /// ================= CLEAR ALL =================

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}