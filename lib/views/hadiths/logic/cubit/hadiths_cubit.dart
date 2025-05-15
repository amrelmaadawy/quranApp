import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranapp/core/model/hadith/hadith_items/hadith_items.dart';
import 'package:quranapp/core/model/hadith/hadith_items/item.dart';

import 'package:quranapp/core/model/hadith/hadith_teller.dart';
import 'package:quranapp/views/hadiths/logic/hadith_services/hadith_services.dart';

part 'hadiths_state.dart';

class HadithsCubit extends Cubit<HadithsState> {
  HadithsCubit() : super(HadithsInitial());
  final HadithServices _hadithServices = HadithServices();
  List<HadithTeller> hadithTellerList = [];
  List<Item> hadithItems = [];
  List<Item> hadith = [];
  HadithItems? hadithData;
  Future<void> getHadithTeller() async {
    emit(GetHadithTellerLoading());
    try {
      var response = await _hadithServices.getData('hadith');

      hadithTellerList =
          (response.data as List<dynamic>)
              .map((e) => HadithTeller.fromJson(e))
              .toList();

      emit(GetHadithTellerSuccess());
    } catch (e) {
      emit(GetHadithTellerError());
    }
  }

  Future<void> getHadiths({
    required String hadithTeller,
    required int pageNum,
  }) async {
    emit(GetHadithLoading());

    try {
      final response = await _hadithServices.getData(
        'hadith/$hadithTeller?page=$pageNum&limit=100',
      );

      // Parse the full response into HadithItems
      hadithData = HadithItems.fromJson(response.data);

      // Get the list of individual hadiths from the 'items' field
      hadithItems = hadithData?.items ?? [];

      emit(GetHadithSuccess());
    } catch (e) {
      print('Error fetching hadiths: $e');
      emit(GetHadithError());
    }
  }
}
