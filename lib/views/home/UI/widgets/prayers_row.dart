import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/pray_time_cubit/pray_time_cubit.dart';
import 'package:quranapp/views/home/logic/prayers.dart';

class PrayersRow extends StatefulWidget {
  const PrayersRow({super.key});

  @override
  State<PrayersRow> createState() => _PrayersRowState();
}

class _PrayersRowState extends State<PrayersRow> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayTimeCubit, PrayTimeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var prayTimeCubit = context.read<PrayTimeCubit>();
        List<Prayers> prayers = [
          Prayers(
            name: 'العشاء',
            icon: Image.asset(
              'assets/images/isha.png',
              color: AppColor.kunselectedicon,
            ),
            time:
                state is GetPrayTimeLoading
                    ? ''
                    : prayTimeCubit.formatTimeTo12Hour(
                      prayTimeCubit.timings[0].isha!,
                    ),
          ),
          Prayers(
            name: 'المغرب',
            icon: Image.asset(
              'assets/images/maghrib.png',
              color: AppColor.kunselectedicon,
            ),
            time:
                state is GetPrayTimeLoading
                    ? ''
                    : prayTimeCubit.formatTimeTo12Hour(
                      prayTimeCubit.timings[0].maghrib!,
                    ),
          ),
          Prayers(
            name: 'العصر',
            icon: Image.asset(
              'assets/images/elasr.png',
              color: AppColor.kunselectedicon,
            ),
            time:
                state is GetPrayTimeLoading
                    ? ''
                    : prayTimeCubit.formatTimeTo12Hour(
                      prayTimeCubit.timings[0].asr!,
                    ),
          ),
          Prayers(
            name: 'الظهر',
            icon: Image.asset(
              'assets/images/dhur1.png',
              color: AppColor.kunselectedicon,
            ),
            time:
                state is GetPrayTimeLoading
                    ? ''
                    : prayTimeCubit.formatTimeTo12Hour(
                      prayTimeCubit.timings[0].dhuhr!,
                    ),
          ),
          Prayers(
            name: 'الشروق',
            icon: Image.asset(
              'assets/images/sunrise.png',
              color: AppColor.kunselectedicon,
            ),
            time:
                state is GetPrayTimeLoading
                    ? ''
                    : prayTimeCubit.formatTimeTo12Hour(
                      prayTimeCubit.timings[0].sunrise!,
                    ),
          ),
          Prayers(
            name: 'الفجر',
            icon: Image.asset(
              'assets/images/fajr.png',
              color: AppColor.kunselectedicon,
            ),
            time:
                state is GetPrayTimeLoading
                    ? ''
                    : prayTimeCubit.formatTimeTo12Hour(
                      prayTimeCubit.timings[0].fajr!,
                    ),
          ),
        ];
        return SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 35),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: prayers[index].icon),
                    Text(prayers[index].name),
                    Text(prayers[index].time),
                  ],
                ),
              );
            },
            itemCount: prayers.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    PrayTimeCubit().close();
    super.dispose();
  }
}
