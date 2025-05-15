import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';

import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/hadiths/UI/widgets/hadith_teller_list.dart';
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
                  return state is GetHadithTellerLoading? SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kprimryColor,
                      ),
                    ),
                  ): Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomAppBar(title: 'رواة الاحاديث'),
                      HadithTellerList(hadithsCubit: hadithsCubit),
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
