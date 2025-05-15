import 'package:equatable/equatable.dart';

class HadithTeller extends Equatable {
  final String? name;
  final String? slug;
  final int? total;
  final String? arabicName;

  const HadithTeller({this.name, this.slug, this.total, this.arabicName});

  factory HadithTeller.fromJson(Map<String, dynamic> json) {
    final englishName = json['name'] as String?;
    final arabic = hadithNameTranslations[englishName] ?? englishName;

    return HadithTeller(
      name: englishName,
      slug: json['slug'] as String?,
      total: json['total'] as int?,
      arabicName: arabic,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'slug': slug,
    'total': total,
    'arabicName': arabicName,
  };

  @override
  List<Object?> get props => [name, slug, total, arabicName];
}

const Map<String, String> hadithNameTranslations = {
  "Abu Dawud": "أبو داود",
  "Ahmad": "أحمد بن حنبل",
  "Bukhari": "البخاري",
  "Darimi": "الدارمي",
  "Ibnu Majah": "ابن ماجه",
  "Malik": "مالك",
  "Muslim": "مسلم",
  "Nasai": "النسائي",
  "Tirmidzi": "الترمذي",
};
