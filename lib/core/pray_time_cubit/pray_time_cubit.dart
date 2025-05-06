import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:quranapp/core/Services/dio_services.dart';
import 'package:quranapp/core/model/prayers_time/timings.dart';

part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit() : super(PrayTimeInitial());
  final DioServises _dioServises = DioServises();
  List<Timings> timings = [];

  Future<void> getPrayTime() async {
    emit(GetPrayTimeLoading());
    try {
      // Format date with leading zeros
      final day = DateTime.now().day.toString().padLeft(2, '0');
      final month = DateTime.now().month.toString().padLeft(2, '0');
      final year = DateTime.now().year;

      final response = await _dioServises.getData(
        "$day-$month-$year?city=cairo&country=egypt&method=8",
      );
      // Verify response data structure

      timings.add(Timings.fromJson(response.data['data']['timings']));
    
      emit(GetPrayTimeSuccess());
    } catch (e) {
      emit(GetPrayTimeFailed());
      if (kDebugMode) {
        print(e);
      }
    }
  }


String formatTimeTo12Hour(String? time24) {
  if (time24 == null) return "N/A";
  
  try {
    final dateFormat = DateFormat("HH:mm");
    final dateTime = dateFormat.parse(time24);
    return DateFormat("h:mm a").format(dateTime); // e.g., "5:30 AM"
  } catch (e) {
    return time24; // Fallback if parsing fails
  }
}
}
