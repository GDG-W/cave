import 'package:cave/cave.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model.dart';

part 'ui_state.dart';

final speakersViewModelNotifier =
    AutoDisposeNotifierProvider<SpeakersViewModel, SpeakersUiState>(
  () => SpeakersViewModel(),
);

final class SpeakersViewModel extends AutoDisposeNotifier<SpeakersUiState> {
  late DashboardApiService _apiService;

  @override
  SpeakersUiState build() {
    _apiService = const DashboardApiService(ConferenceNetworkClient());
    return const SpeakersUiState.initial();
  }

  Future<void> fetchSpeakers({bool refresh = false}) async {
    await launch(state.ref, (model) async {
      state = model.emit(state.copyWith(uiState: UiState.loading));
      final result = await _apiService.getSpeakers(refresh: refresh);

      state = model.emit(result.fold(
        (left) => state.copyWith(uiState: UiState.error, error: left),
        (right) =>
            state.copyWith(uiState: UiState.success, speakers: right.speakers),
      ));
    });
  }
}
