import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/hadiths/logic/cubit/hadiths_cubit.dart';

class Hadiths extends StatelessWidget {
  const Hadiths({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => HadithsCubit()..getHadithTeller(),
            child: SingleChildScrollView(
              child: BlocConsumer<HadithsCubit, HadithsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  HadithsCubit hadithsCubit = context.read<HadithsCubit>();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomAppBar(title: 'رواة الاحاديث'),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.all(5),
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Scaffold(
                                          body: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                15.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  CustomAppBar(title: ''),
                                                  ListView.builder(
                                                    itemBuilder: (
                                                      context,
                                                      listindex,
                                                    ) {
                                                      return AdhkarCard(
                                                        alzekr: '',
                                                        descrption: '',
                                                      );
                                                    },
                                                    itemCount: 1,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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
                                      hadithsCubit
                                              .hadithTellerList[index]
                                              .arabicName ??
                                          '',
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
