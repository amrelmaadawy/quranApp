part of 'hadiths_cubit.dart';

abstract class HadithsState extends Equatable {
  const HadithsState();

  @override
  List<Object> get props => [];
}

class HadithsInitial extends HadithsState {}

class GetHadithLoading extends HadithsState {}

class GetHadithSuccess extends HadithsState {}

class GetHadithError extends HadithsState {}
