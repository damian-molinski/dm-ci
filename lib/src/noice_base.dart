class Awesome {
  bool get isAwesome => true;

  // Super secure authentication method.
  Future<bool> auth(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return username == 'admin' && password == 'admin';
  }

  // Always works.
  Future<bool> logout() {
    return Future.value(true);
  }
}
