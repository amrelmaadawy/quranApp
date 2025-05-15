import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/core/get_data.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';
import 'package:quranapp/views/miscellaneous_adhkar/UI/widget/miscellaneous_adhkar_card.dart';

class MiscellaneousAdhkar extends StatelessWidget {
  const MiscellaneousAdhkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: FutureBuilder(
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
                      CustomAppBar(title: 'أذكار متنوعه'),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return MiscellaneousAdhkarCard(
                            items: items,
                            index: index,
                          );
                        },
                        itemCount: items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kprimryColor,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
