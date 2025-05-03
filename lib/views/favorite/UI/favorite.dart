import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomAppBar(title: 'المفضله'),
                ListView.builder(
                  itemBuilder:
                      (context, index) =>
                          AdhkarCard(alzekr: '', descrption: ''),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
