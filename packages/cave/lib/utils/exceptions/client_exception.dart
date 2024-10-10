import 'exceptions.dart';

base class ClientException extends Devfest2024Exception {
  final String detail;
  final Map<String, String> validationDetail;

  const ClientException({
    required this.detail,
    this.validationDetail = const {},
  });

  factory ClientException.fromJson(Map<String, dynamic> json) =>
      ClientException(
        detail: json['message'] ?? '',
        validationDetail: switch (json['data']) {
          Map data => data
              .map((key, value) => MapEntry(key.toString(), value.toString())),
          _ => {},
        },
      );

  @override
  String toString() {
    return detail;
  }
}

final class UnauthorizedUserException extends ClientException {
  const UnauthorizedUserException({required super.detail});

  factory UnauthorizedUserException.fromJson(Map<String, dynamic> json) =>
      UnauthorizedUserException(detail: json['message'] ?? '');
}

final class WithCachedDataException<E extends Object?> extends ClientException {
  const WithCachedDataException({required super.detail, required this.result});

  final E result;

  factory WithCachedDataException.fromJson(
      Map<String, dynamic> json, E Function(dynamic data) transformer) {
    final errorObject = json['errorObject'] as Map<String, dynamic>;
    final dataObject = json['cachedObject'] as Object?;
    return WithCachedDataException(
      detail: errorObject['message'] ?? '',
      result: transformer(dataObject),
    );
  }
}
