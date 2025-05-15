import 'package:flutter/material.dart';
import 'package:quranapp/views/hadiths/UI/widgets/hadiths_list.dart';
import 'package:quranapp/views/hadiths/logic/cubit/hadiths_cubit.dart';

class HadithTellerList extends StatelessWidget {
  const HadithTellerList({super.key, required this.hadithsCubit});

  final HadithsCubit hadithsCubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(5),
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () async {
                await hadithsCubit.getHadiths(
                  hadithTeller: hadithsCubit.hadithTellerList[index].slug!,
                  pageNum: 1,
                );
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HadithsList(
                        hadithsCubit: hadithsCubit,
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
                    hadithsCubit.hadithTellerList[index].arabicName ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: hadithsCubit.hadithTellerList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
