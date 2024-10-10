import 'package:equatable/equatable.dart';

final class SponsorsDto extends Equatable {
  final List<CategorySponsors> sponsorCategories;

  const SponsorsDto({required this.sponsorCategories});

  factory SponsorsDto.fromJson(dynamic json) => SponsorsDto(
        sponsorCategories: switch (json) {
          List list =>
            list.map((item) => CategorySponsors.fromJson(item)).toList(),
          _ => [],
        },
      );

  dynamic toJson() => sponsorCategories;

  @override
  List<Object?> get props => [sponsorCategories];
}

final class CategorySponsors extends Equatable {
  final String category;
  final List<SponsorDto> sponsors;

  const CategorySponsors({required this.category, required this.sponsors});

  factory CategorySponsors.fromJson(Map<String, dynamic> json) =>
      CategorySponsors(
        category: json['category'],
        sponsors: switch (json['sponsors']) {
          List list => list.map((item) => SponsorDto.fromJson(item)).toList(),
          _ => [],
        },
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'sponsors': sponsors,
      };

  @override
  List<Object?> get props => [category, sponsors];
}

final class SponsorDto extends Equatable {
  final String id;
  final String name;
  final String logoUrl;
  final String category;
  final String website;

  const SponsorDto({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.category,
    required this.website,
  });

  factory SponsorDto.fromJson(Map<String, dynamic> json) => SponsorDto(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        logoUrl: json['logo_url'] ?? '',
        category: json['category'] ?? '',
        website: json['website'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo_url': logoUrl,
        'category': category,
        'website': website,
      };

  @override
  List<Object?> get props => [id, name, logoUrl, category, website];
}
