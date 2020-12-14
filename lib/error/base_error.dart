class BaseException implements Exception {
  final dynamic code;
  final String message;

  BaseException(this.message, {this.code});

  @override
  String toString() => message;
}