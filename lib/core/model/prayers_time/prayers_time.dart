import 'date.dart';
import 'timings.dart';

class PrayersTime {
  Timings? timings;
  Date? date;

  PrayersTime({this.timings, this.date});

  factory PrayersTime.fromJson(Map<String, dynamic> json) => PrayersTime(
    timings:
        json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
    date:
        json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'timings': timings?.toJson(),
    'date': date?.toJson(),
  };
}
