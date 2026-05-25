class Awesome {
  (String, String)? _auth;

  bool get isAwesome => true;

  // Super secure authentication method.
  Future<bool> auth(String username, String password) async {
    final allowed = username == 'admin' && password == 'admin';

    if (allowed) {
      _auth = (username, password);
    } else {
      _auth = null;
    }

    return allowed;
  }

  // Always works.
  Future<bool> logout() async {
    final isLoggedOut = _auth != null;
    _auth = null;
    return isLoggedOut;
  }

  Future<String> resetPassword() async {
    if (_auth == null) {
      throw Exception('Not authenticated');
    }
    return 'newPassword123';
  }
}
