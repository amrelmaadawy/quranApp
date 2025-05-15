import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/hadiths/UI/widgets/pages_number_list.dart';
import 'package:quranapp/views/hadiths/logic/cubit/hadiths_cubit.dart';

class HadithsList extends StatelessWidget {
  const HadithsList({
    super.key,
    required this.hadithsCubit,
    required this.index,
  });

  final HadithsCubit hadithsCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomAppBar(
                title: hadithsCubit.hadithTellerList[index].arabicName ?? '',
              ),
              PagesNumberList(hadithsCubit: hadithsCubit, index: index),
              ListView.builder(
                itemBuilder: (context, listindex) {
                  return AdhkarCard(
                    alzekr: hadithsCubit.hadithItems[listindex].arab ?? '',
                    descrption: '',
                  );
                },
                itemCount: hadithsCubit.hadithItems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              PagesNumberList(hadithsCubit: hadithsCubit, index: index),
            ],
          ),
        ),
      ),
    );
  }
}
