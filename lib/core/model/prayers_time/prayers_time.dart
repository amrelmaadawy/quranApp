import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class PrayersTime {
  Timings? timings;
  Date? date;
  Meta? meta;

  PrayersTime({this.timings, this.date, this.meta});

  factory PrayersTime.fromJson(Map<String, dynamic> json) => PrayersTime(
    timings:
        json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
    date:
        json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
    meta:
        json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'timings': timings?.toJson(),
    'date': date?.toJson(),
    'meta': meta?.toJson(),
  };
}
