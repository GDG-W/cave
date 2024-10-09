import 'base_exception.dart';

final class EmptyException extends Devfest2024Exception {
  const EmptyException();

  @override
  String toString() => '';
}

final class GroundException extends Devfest2024Exception {
  final String message;
  final StackTrace? stackTrace;

  const GroundException(this.message, {this.stackTrace});

  @override
  String toString() => message;
}
