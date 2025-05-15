import 'package:flutter/material.dart';
import 'package:quranapp/core/Services/connection_services.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/views/quran/UI/widgets/main_quran_view.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: ConnectionServices.checkConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: AppColor.kprimryColor),
              ),
            );
          } else if (snapshot.hasError || !snapshot.data!) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'لا يوجد اتصال بالإنترنت، من فضلك تأكد من اتصالك بالشبكة',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            );
          } else {
            return const MainQuranView();
          }
        },
      ),
    );
  }
}
