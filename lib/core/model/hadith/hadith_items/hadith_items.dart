import 'package:equatable/equatable.dart';

import 'item.dart';
import 'pagination.dart';

class HadithItems extends Equatable {
  final String? name;
  final String? slug;
  final int? total;
  final Pagination? pagination;
  final List<Item>? items;

  const HadithItems({
    this.name,
    this.slug,
    this.total,
    this.pagination,
    this.items,
  });

  factory HadithItems.fromJson(Map<String, dynamic> json) => HadithItems(
    name: json['name'] as String?,
    slug: json['slug'] as String?,
    total: json['total'] as int?,
    pagination:
        json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'slug': slug,
    'total': total,
    'pagination': pagination?.toJson(),
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [name, slug, total, pagination, items];
}
