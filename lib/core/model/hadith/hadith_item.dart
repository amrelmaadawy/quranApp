import 'package:equatable/equatable.dart';

class HadithItem extends Equatable {
  final int? number;
  final String? arab;
  final String? id;

  const HadithItem({this.number, this.arab, this.id});

  factory HadithItem.fromJson(Map<String, dynamic> json) => HadithItem(
    number: json['number'] as int?,
    arab: json['arab'] as String?,
    id: json['id'] as String?,
  );

  Map<String, dynamic> toJson() => {'number': number, 'arab': arab, 'id': id};

  @override
  List<Object?> get props => [number, arab, id];
}
