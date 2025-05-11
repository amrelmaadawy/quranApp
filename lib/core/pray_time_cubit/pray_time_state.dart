part of 'pray_time_cubit.dart';

abstract class PrayTimeState {}

class PrayTimeInitial extends PrayTimeState {}

class GetPrayTimeLoading extends PrayTimeState {}

class GetPrayTimeSuccess extends PrayTimeState 
{
  final List<Timings> timings;
  GetPrayTimeSuccess({required this.timings});
}

class GetPrayTimeFailed extends PrayTimeState {}
