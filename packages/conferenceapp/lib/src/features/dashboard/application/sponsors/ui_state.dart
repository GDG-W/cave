part of 'view_model.dart';

final class SponsorsUiState extends Devfest2024UiState {
  final List<CategorySponsors> sponsorCategories;

  const SponsorsUiState({
    super.error,
    super.uiState,
    required this.sponsorCategories,
  });

  const SponsorsUiState.initial() : this(sponsorCategories: const []);

  SponsorsUiState copyWith({
    List<CategorySponsors>? sponsorCategories,
    UiState? uiState,
    Devfest2024Exception? error,
  }) {
    return SponsorsUiState(
      sponsorCategories: sponsorCategories ?? this.sponsorCategories,
      uiState: uiState ?? this.uiState,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get otherProps => [sponsorCategories];
}
