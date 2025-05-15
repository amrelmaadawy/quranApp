import 'package:flutter/material.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/quran/Logic/quran_cubit.dart';

class AyahsView extends StatelessWidget {
  const AyahsView({
    super.key,
    required this.quranCubit,
    required this.fullSurahText,
    required this.index,
  });

  final QuranCubit quranCubit;
  final String fullSurahText;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              CustomAppBar(title: quranCubit.surhsNameList[index]),

              Card(
                margin: const EdgeInsets.all(5),
                color: Colors.lightBlue.shade50,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade50,

                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Directionality(
                      // makes text RTL
                      textDirection: TextDirection.rtl,
                      child: Text(
                        fullSurahText,
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 22, height: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
