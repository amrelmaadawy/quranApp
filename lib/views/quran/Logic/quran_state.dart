part of 'quran_cubit.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class GetSurhsNameLoading extends QuranState {}

class GetSurhsNameSuccess extends QuranState {}

class GetSurhsNameError extends QuranState {}

class GetAyahsLoading extends QuranState {}

class GetAyahsSuccess extends QuranState {}

class GetAyahsError extends QuranState {}
