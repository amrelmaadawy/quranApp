import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/views/quran/Logic/quran_cubit.dart';
import 'package:quranapp/views/quran/UI/widgets/surh_card.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QuranCubit()..getSurhsName(),
        child: BlocConsumer<QuranCubit, QuranState>(
          listener: (context, state) {},
          builder: (context, state) {
            QuranCubit quranCubit = context.read<QuranCubit>();

            return state is GetSurhsNameLoading
                ? SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kprimryColor,
                    ),
                  ),
                )
                : SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomAppBar(title: 'القرآن الكريم '),
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return SurhCard(quranCubit: quranCubit,index:index);
                          },
                          itemCount: quranCubit.surhsNameList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ],
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }
}
