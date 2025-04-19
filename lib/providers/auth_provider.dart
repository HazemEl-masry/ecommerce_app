import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _token;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  String? get userId => _userId;

  final _storage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    try {
      // TODO: Implement actual login logic with your backend
      // For now, we'll simulate a successful login
      _isAuthenticated = true;
      _token = 'dummy_token';
      _userId = email;
      
      // Store credentials securely
      await _storage.write(key: 'token', value: _token);
      await _storage.write(key: 'userId', value: _userId);
      
      notifyListeners();
      return true;
    } catch (error) {
      _isAuthenticated = false;
      _token = null;
      _userId = null;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    try {
      // TODO: Implement actual signup logic with your backend
      // For now, we'll simulate a successful signup
      _isAuthenticated = true;
      _token = 'dummy_token';
      _userId = email;
      
      // Store credentials securely
      await _storage.write(key: 'token', value: _token);
      await _storage.write(key: 'userId', value: _userId);
      
      notifyListeners();
      return true;
    } catch (error) {
      _isAuthenticated = false;
      _token = null;
      _userId = null;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _token = null;
    _userId = null;
    
    // Clear stored credentials
    await _storage.deleteAll();
    
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async {
    final token = await _storage.read(key: 'token');
    final userId = await _storage.read(key: 'userId');
    
    if (token != null && userId != null) {
      _token = token;
      _userId = userId;
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }
}
