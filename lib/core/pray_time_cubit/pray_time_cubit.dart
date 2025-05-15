import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:quranapp/core/Services/timing_services.dart';
import 'package:quranapp/core/model/prayers_time/gregorian.dart';
import 'package:quranapp/core/model/prayers_time/hijri.dart';
import 'package:quranapp/core/model/prayers_time/timings.dart';
import 'package:quranapp/core/Services/notificatoin_service.dart';

part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit() : super(PrayTimeInitial());
  final TimingServises _dioServises = TimingServises();
  List<Timings> timings = [];
  List<Hijri> hijri = [];
  List<Gregorian> gregorian = [];
  Future<void> getPrayTime() async {
    emit(GetPrayTimeLoading());
    try {
      final day = DateTime.now().day.toString().padLeft(2, '0');
      final month = DateTime.now().month.toString().padLeft(2, '0');
      final year = DateTime.now().year;

      final response = await _dioServises.getData(
        "$day-$month-$year?city=cairo&country=egypt&method=8",
      );

      final timing = Timings.fromJson(response.data['data']['timings']);
      final hijriDate = Hijri.fromJson(response.data['data']['date']['hijri']);
      final gregorianDate = Gregorian.fromJson(
        response.data['data']['date']['gregorian'],
      );
      hijri = [hijriDate];
      gregorian = [gregorianDate];
      timings = [timing];
      emit(GetPrayTimeSuccess(timings: timings));

      // Schedule notification for each prayer
      _schedulePrayerNotifications(timing);
    } catch (e) {
      emit(GetPrayTimeFailed());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Map<String, String> getCurrentPrayerInfo() {
    if (timings.isEmpty) return {'name': '', 'time': ''};

    final currentTiming = timings.first;
    final prayers = [
      {"name": "الفجر", "time": currentTiming.fajr},
      {"name": "الظهر", "time": currentTiming.dhuhr},
      {"name": "العصر", "time": currentTiming.asr},
      {"name": "المغرب", "time": currentTiming.maghrib},
      {"name": "العشاء", "time": currentTiming.isha},
    ];

    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);

    // Find the current prayer by checking between prayer times
    for (int i = 0; i < prayers.length; i++) {
      final prayerTime = prayers[i]['time'];

      if (prayerTime == null) continue;

      // If it's the last prayer (Isha), check if current time is after Isha
      if (i == prayers.length - 1) {
        if (currentTime.compareTo(prayerTime) >= 0) {
          return {'name': prayers[i]['name']!, 'time': _formatTime(prayerTime)};
        }
      }
      // For other prayers, check if current time is between this prayer and next
      else {
        final nextPrayerTime = prayers[i + 1]['time'];
        if (nextPrayerTime == null) continue;

        if (currentTime.compareTo(prayerTime) >= 0 &&
            currentTime.compareTo(nextPrayerTime) < 0) {
          return {'name': prayers[i]['name']!, 'time': _formatTime(prayerTime)};
        }
      }
    }

    return {'name': '', 'time': ''};
  }

  Map<String, String> getNextPrayerInfo() {
    if (timings.isEmpty) return {'name': 'الفجر', 'time': ''};

    final currentTiming = timings.first;
    final prayers = [
      {"name": "الفجر", "time": currentTiming.fajr},
      {"name": "الظهر", "time": currentTiming.dhuhr},
      {"name": "العصر", "time": currentTiming.asr},
      {"name": "المغرب", "time": currentTiming.maghrib},
      {"name": "العشاء", "time": currentTiming.isha},
    ];

    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);

    // Find first prayer after current time
    for (var prayer in prayers) {
      if (prayer['time'] != null &&
          currentTime.compareTo(prayer['time']!) < 0) {
        return {'name': prayer['name']!, 'time': _formatTime(prayer['time']!)};
      }
    }

    // If no next prayer today, return tomorrow's Fajr
    return {'name': 'الفجر', 'time': _formatTime(prayers[0]['time']!)};
  }

  String _formatTime(String time24) {
    try {
      final time = DateFormat("HH:mm").parse(time24);
      return DateFormat("h:mm a").format(time);
    } catch (e) {
      return time24;
    }
  }

  String formatTimeTo12Hour(String? time24) {
    if (time24 == null) return "N/A";

    try {
      final dateFormat = DateFormat("HH:mm");
      final dateTime = dateFormat.parse(time24);
      return DateFormat("h:mm a").format(dateTime);
    } catch (e) {
      return time24;
    }
  }

  void _schedulePrayerNotifications(Timings timing) {
    final prayers = {
      'الفجر': timing.fajr,
      'الظهر': timing.dhuhr,
      'العصر': timing.asr,
      'المغرب': timing.maghrib,
      'العشاء': timing.isha,
    };

    prayers.forEach((name, time) {
      if (time != null) {
        final parsed = DateFormat('HH:mm').parse(time);
        final now = DateTime.now();
        final scheduledDate = DateTime(
          now.year,
          now.month,
          now.day,
          parsed.hour,
          parsed.minute,
        );

        // If time is in the past, skip or schedule for next day if needed
        if (scheduledDate.isAfter(now)) {
          NotificationService.schiduleNotification(
            'موعد صلاة $name',
            'حان الآن موعد صلاة $name',
            scheduledDate,
          );
        }
      }
    });
  }

  final Map<String, String> gregorianMonthArabicNames = {
    'January': 'يناير',
    'February': 'فبراير',
    'March': 'مارس',
    'April': 'أبريل',
    'May': 'مايو',
    'June': 'يونيو',
    'July': 'يوليو',
    'August': 'أغسطس',
    'September': 'سبتمبر',
    'October': 'أكتوبر',
    'November': 'نوفمبر',
    'December': 'ديسمبر',
  };
}
