part of 'pray_time_cubit.dart';

abstract class PrayTimeState {}

class PrayTimeInitial extends PrayTimeState {}

class GetPrayTimeLoading extends PrayTimeState {}

class GetPrayTimeSuccess extends PrayTimeState {}

class GetPrayTimeFailed extends PrayTimeState {}
