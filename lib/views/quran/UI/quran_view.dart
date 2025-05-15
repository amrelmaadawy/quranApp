import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomAppBar(title: 'القرآن الكريم '),
          ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(5),
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      CustomAppBar(title: ''),
                                      ListView.builder(
                                        itemBuilder: (context, listindex) {
                                          return AdhkarCard(
                                            alzekr: '',
                                            descrption: '',
                                          );
                                        },
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
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
                        Text('', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
