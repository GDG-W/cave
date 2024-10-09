import 'package:cave/cave.dart';
import 'profile_dto.dart';

import 'speakers_dto.dart';
import 'sessions_dto.dart';
import 'sponsors_dto.dart';

final class DashboardApiService {
  const DashboardApiService(this._networkClient);

  final ConferenceNetworkClient _networkClient;

  FutureDevfest2024ExceptionOr<ProfileResponseDto> fetchUserProfile(
      {bool refresh = false}) async {
    final response = await _networkClient.call(
      path: ConferenceApis.instance.getUserProfile,
      method: RequestMethod.get,
      forceRefresh: refresh,
    );

    return await processData((p0) => ProfileResponseDto.fromJson(p0), response);
  }

  FutureDevfest2024ExceptionOr<AgendasDto> fetchAgenda(
      {bool refresh = false}) async {
    final response = await _networkClient.call(
      path: ConferenceApis.instance.getEventSessions,
      method: RequestMethod.get,
      forceRefresh: refresh,
    );

    return await processData(AgendasDto.fromJson, response);
  }

  FutureDevfest2024ExceptionOr<SponsorsDto> getSponsors(
      {bool refresh = false}) async {
    final response = await _networkClient.call(
      path: ConferenceApis.instance.getEventSponsors,
      method: RequestMethod.get,
      forceRefresh: refresh,
    );

    return await processData(SponsorsDto.fromJson, response);
  }

  FutureDevfest2024ExceptionOr<SpeakersDto> getSpeakers(
      {bool refresh = false}) async {
    final response = await _networkClient.call(
      path: ConferenceApis.instance.getSpeakers,
      method: RequestMethod.get,
      forceRefresh: refresh,
    );

    return await processData(SpeakersDto.fromJson, response);
  }
}
