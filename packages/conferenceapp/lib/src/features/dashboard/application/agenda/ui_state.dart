part of 'view_model.dart';

final class AgendaUiState extends Devfest2024UiState {
  final List<AgendaDto> agendas;

  const AgendaUiState({
    super.uiState,
    super.error,
    required this.agendas,
  });

  const AgendaUiState.initial() : this(agendas: const []);

  AgendaUiState copyWith({
    UiState? uiState,
    Devfest2024Exception? error,
    List<AgendaDto>? agendas,
  }) {
    return AgendaUiState(
      uiState: uiState ?? this.uiState,
      error: error ?? this.error,
      agendas: agendas ?? this.agendas,
    );
  }

  @override
  List<Object?> get otherProps => [agendas];
}
