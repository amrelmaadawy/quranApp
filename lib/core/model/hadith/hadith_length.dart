import 'package:equatable/equatable.dart';

class HadithLength extends Equatable {
  final int? totalItems;
  final int? currentPage;
  final int? pageSize;
  final int? totalPages;
  final int? startPage;
  final int? endPage;
  final int? startIndex;
  final int? endIndex;
  final List<int>? pages;

  const HadithLength({
    this.totalItems,
    this.currentPage,
    this.pageSize,
    this.totalPages,
    this.startPage,
    this.endPage,
    this.startIndex,
    this.endIndex,
    this.pages,
  });

  factory HadithLength.fromJson(Map<String, dynamic> json) => HadithLength(
    totalItems: json['totalItems'] as int?,
    currentPage: json['currentPage'] as int?,
    pageSize: json['pageSize'] as int?,
    totalPages: json['totalPages'] as int?,
    startPage: json['startPage'] as int?,
    endPage: json['endPage'] as int?,
    startIndex: json['startIndex'] as int?,
    endIndex: json['endIndex'] as int?,
    pages: json['pages'] as List<int>?,
  );

  Map<String, dynamic> toJson() => {
    'totalItems': totalItems,
    'currentPage': currentPage,
    'pageSize': pageSize,
    'totalPages': totalPages,
    'startPage': startPage,
    'endPage': endPage,
    'startIndex': startIndex,
    'endIndex': endIndex,
    'pages': pages,
  };

  @override
  List<Object?> get props {
    return [
      totalItems,
      currentPage,
      pageSize,
      totalPages,
      startPage,
      endPage,
      startIndex,
      endIndex,
      pages,
    ];
  }
}
