import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/core/get_data.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';

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
                          return Card(
                            margin: const EdgeInsets.all(5),
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Scaffold(
                                          body: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                15.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  CustomAppBar(
                                                    title:
                                                        items[index].category ??
                                                        '',
                                                  ),
                                                  ListView.builder(
                                                    itemBuilder: (
                                                      context,
                                                      listindex,
                                                    ) {
                                                      return AdhkarCard(
                                                        alzekr:
                                                            items[index]
                                                                .array![listindex]
                                                                .text ??
                                                            '',
                                                        descrption: '',
                                                      );
                                                    },
                                                    itemCount:
                                                        items[index]
                                                            .array!
                                                            .length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back),

                                    Spacer(),
                                    Text(
                                      items[index].category ?? '',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: items.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
