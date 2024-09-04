import 'package:devfest24/src/shared/exceptions/base_exception.dart';

final class EmptyException extends Devfest2024Exception {
  const EmptyException();

  @override
  String toString() => '';
}
