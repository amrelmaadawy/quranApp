import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? number;
  final String? arab;
  final String? id;

  const Item({this.number, this.arab, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    number: json['number'] as int?,
    arab: json['arab'] as String?,
    id: json['id'] as String?,
  );

  Map<String, dynamic> toJson() => {'number': number, 'arab': arab, 'id': id};

  @override
  List<Object?> get props => [number, arab, id];
}
