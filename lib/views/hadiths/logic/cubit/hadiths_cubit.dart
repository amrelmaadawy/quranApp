import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/core/model/hadith/hadith_teller.dart';
import 'package:quranapp/views/hadiths/logic/hadith_services/hadith_services.dart';

part 'hadiths_state.dart';

class HadithsCubit extends Cubit<HadithsState> {
  HadithsCubit() : super(HadithsInitial());
  final HadithServices _hadithServices = HadithServices();
  List<HadithTeller> hadithTellerList = [];

  Future<void> getHadithTeller() async {
    emit(GetHadithLoading());
    try {
      var response = await _hadithServices.getData('hadith');

      hadithTellerList =
          (response.data as List<dynamic>)
              .map((e) => HadithTeller.fromJson(e))
              .toList();
    
      
      emit(GetHadithSuccess());
    } catch (e) {
      emit(GetHadithError());
    }
  }
  
}
