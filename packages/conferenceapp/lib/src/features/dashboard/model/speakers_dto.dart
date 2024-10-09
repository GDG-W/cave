import 'package:equatable/equatable.dart';

final class SpeakersDto extends Equatable {
  final List<SpeakerDto> speakers;

  const SpeakersDto({required this.speakers});

  factory SpeakersDto.fromJson(dynamic json) => SpeakersDto(
        speakers: switch (json) {
          List list => list.map((e) => SpeakerDto.fromJson(e)).toList(),
          _ => const [],
        },
      );

  dynamic toJson() => speakers;

  @override
  List<Object?> get props => [speakers];
}

final class SpeakerDto extends Equatable {
  final String id;
  final String fullname;
  final String title;
  final String company;
  final String bio;
  final String imageUrl;
  final Map<String, dynamic> links;
  final List<SpeakerSessionDto> sessions;

  const SpeakerDto({
    required this.id,
    required this.fullname,
    required this.title,
    required this.company,
    required this.bio,
    required this.imageUrl,
    required this.links,
    required this.sessions,
  });

  factory SpeakerDto.fromJson(Map<String, dynamic> json) => SpeakerDto(
        id: json['id'] ?? '',
        fullname: json['fullname'] ?? '',
        title: json['title'] ?? '',
        company: json['company'] ?? '',
        bio: json['bio'] ?? '',
        imageUrl: json['image_url'] ?? '',
        links: switch (json['links']) {
          Map map => map.map((key, value) => MapEntry(key.toString(), value)),
          _ => const {},
        },
        sessions: switch (json['sessions']) {
          List list => list.map((e) => SpeakerSessionDto.fromJson(e)).toList(),
          _ => const [],
        },
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'title': title,
        'company': company,
        'bio': bio,
        'image_url': imageUrl,
        'links': links,
        'sessions': sessions,
      };

  @override
  List<Object?> get props =>
      [id, fullname, title, company, bio, imageUrl, links];
}

final class SpeakerSessionDto extends Equatable {
  final String title;
  final String id;
  final String venue;
  final DateTime? startTime;
  final int duration;

  const SpeakerSessionDto(
      {required this.title,
      required this.id,
      required this.venue,
      required this.startTime,
      required this.duration});

  factory SpeakerSessionDto.fromJson(Map<String, dynamic> json) =>
      SpeakerSessionDto(
        title: json['title'] ?? '',
        id: json['id'] ?? '',
        venue: json['venue'] ?? '',
        startTime: DateTime.tryParse(json['start_time'] ?? ''),
        duration: json['duration'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'venue': venue,
        'start_time': startTime?.toIso8601String(),
        'duration': duration,
      };

  @override
  List<Object?> get props => [title, id, venue, startTime, duration];
}
