import 'package:equatable/equatable.dart';

class HadithTeller extends Equatable {
  final String? name;
  final String? slug;
  final int? total;

  const HadithTeller({this.name, this.slug, this.total});

  factory HadithTeller.fromJson(Map<String, dynamic> json) => HadithTeller(
    name: json['name'] as String?,
    slug: json['slug'] as String?,
    total: json['total'] as int?,
  );

  Map<String, dynamic> toJson() => {'name': name, 'slug': slug, 'total': total};

  @override
  List<Object?> get props => [name, slug, total];
}
