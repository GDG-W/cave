part of 'view_model.dart';

final class SpeakersUiState extends Devfest2024UiState {
  final List<SpeakerDto> speakers;

  const SpeakersUiState({
    super.uiState,
    super.error,
    required this.speakers,
  });

  const SpeakersUiState.initial() : this(speakers: const []);

  SpeakersUiState copyWith({
    UiState? uiState,
    Devfest2024Exception? error,
    List<SpeakerDto>? speakers,
  }) {
    return SpeakersUiState(
      uiState: uiState ?? this.uiState,
      error: error ?? this.error,
      speakers: speakers ?? this.speakers,
    );
  }

  @override
  List<Object?> get otherProps => [speakers];
}
