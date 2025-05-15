import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/views/quran/Logic/quran_services.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  final QuranServices _quranServices = QuranServices();
  List<String> surhsNameList = [];
  Future<void> getSurhsName() async {
    emit(GetSurhsNameLoading());
    try {
      final response = await _quranServices.getData('surah');
      surhsNameList.add(response.data['data']['name']);
      print(surhsNameList);
      emit(GetSurhsNameSuccess());
    } catch (e) {
      print(e);
      emit(GetSurhsNameError());
    }
  }
}
