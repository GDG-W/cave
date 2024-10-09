final class ConferenceApis {
  final String baseUrl;

  const ConferenceApis._(this.baseUrl);

  static const ConferenceApis instance =
      ConferenceApis._(String.fromEnvironment('BASE_URL'));

  String get postInitiateUserSession => '$baseUrl/users/sessions';

  String get getUserProfile => '$baseUrl/users/profile';

  String get getEventSessions => '$baseUrl/events/sessions';

  String get getEventSponsors => '$baseUrl/events/sponsors';

  String get postReserveSession => '$baseUrl/events/reservations';

  String deleteSession(String id) => '$baseUrl/events/reservations/$id';

  String get getSpeakers => '$baseUrl/events/speakers';

  String getSingleSession(String id) => '$baseUrl/events/sessions/$id';
}
