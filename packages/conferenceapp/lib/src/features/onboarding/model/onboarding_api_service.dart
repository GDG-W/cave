import 'package:cave/cave.dart';

import 'user_session_dtos.dart';

final class OnboardingApiService {
  final ConferenceNetworkClient _networkClient;

  const OnboardingApiService(this._networkClient);

  Future<Either<Devfest2024Exception, String>> initiateUserSession(
      InitiateSessionRequestDto dto) async {
    final response = await _networkClient.call(
      path: ConferenceApis.instance.postInitiateUserSession,
      method: RequestMethod.post,
      body: dto.toJson(),
    );

    return await processData(
      (p0) => switch (p0) {
        Map data => (data as Map<String, dynamic>)['token'],
        _ => ''
      },
      response,
    );
  }
}
