import 'package:equatable/equatable.dart';

import 'speakers_dto.dart';

final class AgendasDto extends Equatable {
  final List<AgendaDto> agendas;

  const AgendasDto({
    required this.agendas,
  });

  factory AgendasDto.fromJson(dynamic json) => AgendasDto(
          agendas: switch (json) {
        List list => list.map((e) => AgendaDto.fromJson(e)).toList(),
        _ => [],
      });

  dynamic toJson() => agendas;

  @override
  List<Object?> get props => [agendas];
}

final class AgendaDto extends Equatable {
  final int id;
  final DateTime? start;
  final int duration;
  final SessionsDto sessions;

  const AgendaDto({
    required this.id,
    required this.start,
    required this.duration,
    required this.sessions,
  });

  factory AgendaDto.fromJson(Map<String, dynamic> json) => AgendaDto(
        id: json['id'] ?? 0,
        start: DateTime.tryParse(json['start'] ?? ''),
        duration: json['duration'] ?? 0,
        sessions: SessionsDto.fromJson(json['sessions'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'start': start?.toIso8601String(),
        'duration': duration,
        'sessions': sessions.toJson(),
      };

  @override
  List<Object?> get props => [id, start, duration, sessions];
}

final class SessionsDto extends Equatable {
  final List<SessionDto> sessions;

  const SessionsDto({
    required this.sessions,
  });

  factory SessionsDto.fromJson(dynamic json) => SessionsDto(
        sessions: switch (json) {
          List list => list.map((e) => SessionDto.fromJson(e)).toList(),
          _ => const [],
        },
      );

  dynamic toJson() => sessions;

  @override
  List<Object?> get props => [sessions];
}

final class SessionDto extends Equatable {
  final String id;
  final int periodId;
  final String title;
  final String descrption;
  final String venueId;
  final List<String> categories;
  final List<SpeakerDto> speakers;
  final VenueDto venue;

  const SessionDto({
    required this.id,
    required this.periodId,
    required this.title,
    required this.descrption,
    required this.venueId,
    required this.categories,
    required this.speakers,
    required this.venue,
  });

  factory SessionDto.fromJson(Map<String, dynamic> json) => SessionDto(
        id: json['id'] ?? '',
        periodId: json['period_id'] ?? 0,
        title: json['title'] ?? '',
        descrption: json['description'] ?? '',
        venueId: json['venue_id'] ?? '',
        categories: switch (json['categories']) {
          List list => list.map((e) => e.toString()).toList(),
          _ => const [],
        },
        speakers: switch (json['speakers']) {
          List list => list.map((e) => SpeakerDto.fromJson(e)).toList(),
          _ => const [],
        },
        venue: VenueDto.fromJson(json['venue'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'period_id': periodId,
        'title': title,
        'description': descrption,
        'venue_id': venueId,
        'categories': categories,
        'speakers': speakers.map((e) => e.toJson()).toList(),
        'venue': venue.toJson(),
      };

  @override
  List<Object?> get props =>
      [id, periodId, title, descrption, venueId, categories, speakers, venue];
}

final class VenueDto extends Equatable {
  final String id;
  final num cap;
  final String howToLocate;

  const VenueDto({
    required this.id,
    required this.cap,
    required this.howToLocate,
  });

  factory VenueDto.fromJson(Map<String, dynamic> json) => VenueDto(
        id: json['id'] ?? '',
        cap: json['cap'] ?? 0,
        howToLocate: json['how_to_locate'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cap': cap,
        'how_to_locate': howToLocate,
      };

  @override
  List<Object?> get props => [id, cap, howToLocate];
}
