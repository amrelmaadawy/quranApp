import 'package:flutter/material.dart';
import 'package:quranapp/views/home/UI/widgets/worships_card.dart'
    show WorshipsCard;
import 'package:quranapp/views/offline_home_view/UI/widgets/offline_worships_list.dart';


class OfflineHomeView extends StatelessWidget {
  const OfflineHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'لا يوجد اتصال بالإنترنت، من فضلك تأكد من اتصالك بالشبكة',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.92,
                    child: WorshipsCard()),
                    SizedBox(height: 20,),
                  OfflineWorshipsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
