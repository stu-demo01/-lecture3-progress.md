mixin Logger {
  void log(String message) {
    print('[${DateTime.now().toIso8601String()}] $message');
  }
}
