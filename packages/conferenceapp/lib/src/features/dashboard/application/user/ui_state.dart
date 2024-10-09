part of 'view_model.dart';

final class UserUiState extends Devfest2024UiState {
  final ProfileResponseDto user;

  const UserUiState({
    super.uiState,
    super.error,
    required this.user,
  });

  const UserUiState.initial() : this(user: const ProfileResponseDto.empty());

  UserUiState copyWith({
    UiState? uiState,
    Devfest2024Exception? error,
    ProfileResponseDto? user,
  }) {
    return UserUiState(
      uiState: uiState ?? this.uiState,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get otherProps => [user];
}
