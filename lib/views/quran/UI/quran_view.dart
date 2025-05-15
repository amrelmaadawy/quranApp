import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/quran/Logic/quran_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QuranCubit()..getSurhsName()..getAyahs(),
        child: BlocConsumer<QuranCubit, QuranState>(
          listener: (context, state) {},
          builder: (context, state) {
            QuranCubit quranCubit = context.read<QuranCubit>();
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomAppBar(title: 'القرآن الكريم '),
                  ListView.builder(
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Scaffold(
                                      body: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
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
                                                itemCount: 5,
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
                                Text(quranCubit.surhsNameList[index], style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: quranCubit.surhsNameList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
