import 'package:equatable/equatable.dart';

final class ProfileResponseDto extends Equatable {
  final String id;
  final String fullName;
  final String emailAddress;
  final String role;
  final String levelOfExpertise;
  final String shirtSize;
  final Map<String, dynamic> ticket;

  const ProfileResponseDto({
    required this.id,
    required this.fullName,
    required this.emailAddress,
    required this.role,
    required this.levelOfExpertise,
    required this.shirtSize,
    required this.ticket,
  });

  const ProfileResponseDto.empty()
      : this(
          id: '',
          fullName: '',
          emailAddress: '',
          role: '',
          levelOfExpertise: '',
          shirtSize: '',
          ticket: const {},
        );

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      ProfileResponseDto(
        id: json['id'] ?? '',
        fullName: json['fullname'] ?? '',
        emailAddress: json['email_address'] ?? '',
        role: json['role'] ?? '',
        levelOfExpertise: json['level_of_expertise'] ?? '',
        shirtSize: json['shirt_size'] ?? '',
        ticket: switch (json['ticket']) {
          Map map => map.map((key, value) => MapEntry(key.toString(), value)),
          _ => const {},
        },
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullName,
        'email_address': emailAddress,
        'role': role,
        'level_of_expertise': levelOfExpertise,
        'shirt_size': shirtSize,
        'ticket': ticket,
      };

  @override
  List<Object?> get props => [
        id,
        fullName,
        emailAddress,
        role,
        levelOfExpertise,
        shirtSize,
        ticket,
      ];
}
