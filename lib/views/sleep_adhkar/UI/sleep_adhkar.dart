import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/core/get_data.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';

class SleepAdhkar extends StatelessWidget {
  const SleepAdhkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: GetAdhkar.getAdhkar(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return SnackBar(content: Text('Error'));
                    } else if (snapshot.hasData) {
                      var items = snapshot.data as List<Adhkar>;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomAppBar(title: items[1].category ?? ''),
                          ListView.builder(
                            itemBuilder:
                                (context, index) => AdhkarCard(
                                  alzekr: items[1].array![index].text ?? '',
                                  descrption: '',
                                ),
                            itemCount: items[1].array!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      );
                    } else {
                      return SizedBox(
                        height:
                            MediaQuery.of(context).size.height -
                            100, 
                        child: const Center(child: CircularProgressIndicator(color: AppColor.kprimryColor,)),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
