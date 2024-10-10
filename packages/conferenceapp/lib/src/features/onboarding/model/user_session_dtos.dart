final class InitiateSessionRequestDto {
  final String ticketId;
  final String emailAddress;

  const InitiateSessionRequestDto({
    required this.ticketId,
    required this.emailAddress,
  });

  Map<String, dynamic> toJson() => {
        'id': ticketId,
        'email_address': emailAddress,
      };
}
