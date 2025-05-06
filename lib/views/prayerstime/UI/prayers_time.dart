import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/pray_time_cubit/pray_time_cubit.dart';
import 'package:quranapp/views/home/UI/widgets/home_appbar.dart';
import 'package:quranapp/views/home/logic/prayers.dart';
import 'package:quranapp/views/prayerstime/UI/widget/clock.dart';
import 'package:quranapp/views/prayerstime/UI/widget/prayers_time_appbar.dart';

class PrayersTime extends StatelessWidget {
  const PrayersTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => PrayTimeCubit()..getPrayTime(),
            child: BlocConsumer<PrayTimeCubit, PrayTimeState>(
              listener: (context, state) {},
              builder: (context, state) {
                var prayersTime = context.read<PrayTimeCubit>();
                List<Prayers> prayers = [
                  Prayers(
                    name: 'الفجر',
                    icon: Image.asset(
                      'assets/images/fajr.png',
                      color: AppColor.kunselectedicon,
                    ),
                    time:
                        state is GetPrayTimeLoading
                            ? ''
                            : prayersTime.formatTimeTo12Hour(
                              prayersTime.timings[0].fajr!,
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
                            : prayersTime.formatTimeTo12Hour(
                              prayersTime.timings[0].sunrise!,
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
                            : prayersTime.formatTimeTo12Hour(
                              prayersTime.timings[0].dhuhr!,
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
                            : prayersTime.formatTimeTo12Hour(
                              prayersTime.timings[0].asr!,
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
                            : prayersTime.formatTimeTo12Hour(
                              prayersTime.timings[0].maghrib!,
                            ),
                  ),
                  Prayers(
                    name: 'العشاء',
                    icon: Image.asset(
                      'assets/images/isha.png',
                      color: AppColor.kunselectedicon,
                    ),
                    time:
                        state is GetPrayTimeLoading
                            ? ''
                            : prayersTime.formatTimeTo12Hour(
                              prayersTime.timings[0].isha!,
                            ),
                  ),
                ];

                return Column(
                  children: [
                    PrayersTimeAppBar(),
                    SizedBox(height: 20),
                    HomeAppBar(),
                    SizedBox(height: 20),
                    Clock(),
                    SizedBox(height: 20),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Icon(Icons.volume_off),
                            const SizedBox(width: 10),
                            Text(
                              prayers[index].time,
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Text(
                              prayers[index].name,
                              style: TextStyle(fontSize: 20),
                            ),

                            SizedBox(width: 10),

                            prayers[index].icon,
                          ],
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 20),
                      itemCount: prayers.length,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
