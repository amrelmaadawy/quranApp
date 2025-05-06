import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/core/get_data.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';

class EveningAdhkar extends StatefulWidget {
  const EveningAdhkar({super.key});

  @override
  State<EveningAdhkar> createState() => _EveningAdhkarState();
}

class _EveningAdhkarState extends State<EveningAdhkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: GetAdhkar.getAdhkar(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SnackBar(content: Text('Error'));
            } else if (snapshot.hasData) {
              var items = snapshot.data as List<Adhkar>;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomAppBar(title: items[0].category ?? ''),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return AdhkarCard(
                            alzekr: items[0].array![index].text ?? '',
                            descrption: '',
                          );
                        },

                        itemCount: items[0].array!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
