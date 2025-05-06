import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
      print(timings[0].isha);
      emit(GetPrayTimeSuccess());
    } catch (e) {
      emit(GetPrayTimeFailed());
      print(e);
    }
  }
}
