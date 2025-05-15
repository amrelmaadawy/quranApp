import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/pray_time_cubit/pray_time_cubit.dart';
import 'package:quranapp/views/home/logic/locatoin_services.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayTimeCubit, PrayTimeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var prayTimeCubit = context.read<PrayTimeCubit>();
        return FutureBuilder<String>(
          future: LocationService.getUserLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('جاري تحديد الموقع...');
            } else if (snapshot.hasError) {
              return Text('حدث خطأ أثناء تحديد الموقع');
            } else if (snapshot.hasData) {
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ' المكان ',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                       '${snapshot.data}' == 'Location services are disabled.'
                            ? 'لا يوجد موقع'
                            : '${snapshot.data}',
                        style: TextStyle(
                          color: AppColor.kprimryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        state is GetPrayTimeSuccess
                            ? ('${prayTimeCubit.hijri[0].weekday!.ar} ${prayTimeCubit.gregorianMonthArabicNames[prayTimeCubit.gregorian[0].month!.en]} ${prayTimeCubit.gregorian[0].year} ')
                            : '',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        state is GetPrayTimeSuccess
                            ? ('${prayTimeCubit.hijri[0].day} ${prayTimeCubit.hijri[0].month?.ar} ${prayTimeCubit.hijri[0].year} ')
                            : '',
                        style: TextStyle(
                          color: AppColor.kprimryColor,
                          fontSize: 18,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Text('لا يوجد موقع');
            }
          },
        );
      },
    );
  }
}
