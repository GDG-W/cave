part of 'session_sign_in_vm.dart';

final class SessionSignInState extends Devfest2024UiState {
  final String email;
  final String ticketId;

  const SessionSignInState({
    super.uiState,
    super.error,
    this.ticketId = '',
    this.email = '',
  });

  SessionSignInState copyWith({
    UiState? uiState,
    Devfest2024Exception? error,
    String? ticketId,
    String? email,
  }) {
    return SessionSignInState(
      uiState: uiState ?? this.uiState,
      error: error ?? this.error,
      email: email ?? this.email,
      ticketId: ticketId ?? this.ticketId,
    );
  }

  @override
  List<Object?> get otherProps => [email, ticketId];
}
