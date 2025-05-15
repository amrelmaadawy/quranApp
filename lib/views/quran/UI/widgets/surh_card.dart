import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/views/quran/Logic/quran_cubit.dart';
import 'package:quranapp/views/quran/UI/widgets/surh_view.dart';

class SurhCard extends StatelessWidget {
  const SurhCard({super.key, required this.quranCubit, required this.index});

  final QuranCubit quranCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is GetAyahsLoading? SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kprimryColor,
                    ),
                  ),
                ): Card(
          margin: const EdgeInsets.all(5),
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () async {
                await quranCubit.getAyahs(surhIndex: index + 1);
                String fullSurahText = quranCubit.ayahsList
                    .map((e) => '${e.text!.trim()} ﴿${e.numberInSurah}﴾')
                    .join(' ');
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AyahsView(
                        quranCubit: quranCubit,
                        fullSurahText: fullSurahText,
                        index: index,
                      );
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  Spacer(),
                  Text(
                    quranCubit.surhsNameList[index],
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
