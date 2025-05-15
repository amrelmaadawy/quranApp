import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/core/model/quran/ayah.dart';
import 'package:quranapp/views/quran/Logic/quran_services.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  final QuranServices _quranServices = QuranServices();
  List<String> surhsNameList = [];
  List<Ayah> ayahsList = [];
  Future<void> getSurhsName() async {
    emit(GetSurhsNameLoading());
    try {
      final response = await _quranServices.getData('surah');
      final List surahList = response.data['data'];
      surhsNameList =
          surahList.map<String>((surah) => surah['name'] as String).toList();
      emit(GetSurhsNameSuccess());
    } catch (e) {
      emit(GetSurhsNameError());
    }
  }

  Future<void> getAyahs({required int surhIndex}) async {
    emit(GetAyahsLoading());
    try {
      final response = await _quranServices.getData('surah/$surhIndex');
      final List allSurhList = response.data['data']['ayahs'];

      ayahsList =
          allSurhList
              .map<Ayah>(
                (ayahJson) => Ayah.fromJson(ayahJson as Map<String, dynamic>),
              )
              .toList();
      emit(GetAyahsSuccess());
    } catch (e) {
      emit(GetAyahsError());
    }
  }
}
