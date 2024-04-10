import 'package:equatable/equatable.dart';

class ArrayResponse<T> extends Equatable {
  final int page;
  final int pageSize;
  final int totalPages;
  final List<T> results;

  const ArrayResponse({
    this.page = 1,
    this.pageSize = 1,
    this.totalPages = 1,
    this.results = const [],
  });

  ArrayResponse<T> copyWith(
          {int? page,
          int? pageSize,
          int? total,
          int? totalPages,
          T? result,
          List<T>? results}) =>
      ArrayResponse<T>(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        totalPages: totalPages ?? this.totalPages,
        results: results ?? this.results,
      );

  factory ArrayResponse.fromJson(
      Map<String, dynamic> json, T Function(Object json) objectFromJson) {
    ArrayResponse<T> resultGeneric = ArrayResponse<T>(
      page: json['page'] as int,
      // pageSize: json['page_size'] as int,
      totalPages: json['total_pages'] as int,
    );
    if (json['results'] != null) {
      if (json['results'] is List) {
        return resultGeneric.copyWith(
          results: (json['results'] as List<dynamic>)
              .map((item) => objectFromJson(item))
              .toList(),
        );
      }
    }
    return resultGeneric;
  }

  @override
  List<Object> get props => [
        page,
        pageSize,
        totalPages,
        results,
      ];
}
