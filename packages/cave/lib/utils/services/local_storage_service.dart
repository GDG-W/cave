import 'package:cave/cave.dart';

final class ConferenceAppStorageService {
  const ConferenceAppStorageService._();

  static const instance = ConferenceAppStorageService._();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIosOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  FlutterSecureStorage get _securedStorageInstance => FlutterSecureStorage(
        aOptions: _getAndroidOptions(),
        iOptions: _getIosOptions(),
      );

  Future<void> setUserToken(String token) async {
    return await _securedStorageInstance.write(key: 'user-token', value: token);
  }

  Future<String> get userToken async {
    return await _securedStorageInstance.read(key: 'user-token') ?? '';
  }
}
