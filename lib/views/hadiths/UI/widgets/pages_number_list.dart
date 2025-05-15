import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/views/hadiths/UI/widgets/hadiths_list.dart';
import 'package:quranapp/views/hadiths/logic/cubit/hadiths_cubit.dart';

class PagesNumberList extends StatelessWidget {
  const PagesNumberList({
    super.key,
    required this.hadithsCubit,
    required this.index,
  });

  final HadithsCubit hadithsCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: hadithsCubit.hadithData!.pagination!.pages!.length,
        itemBuilder: (context, pageNumIndex) {
          return Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await hadithsCubit.getHadiths(
                    hadithTeller: hadithsCubit.hadithTellerList[index].slug!,
                    pageNum:
                        hadithsCubit
                            .hadithData!
                            .pagination!
                            .pages![pageNumIndex],
                  );
                  Navigator.pushReplacement(
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
                child: Text(
                  '${hadithsCubit.hadithData!.pagination!.pages![pageNumIndex]}',
                  style: TextStyle(
                    color: AppColor.kprimryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
