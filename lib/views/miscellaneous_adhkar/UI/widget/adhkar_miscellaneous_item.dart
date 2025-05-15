import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';
import 'package:quranapp/core/components/custom_appbar_worships.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';

class AdhkarMiscellaneousItem extends StatelessWidget {
  const AdhkarMiscellaneousItem({super.key, required this.items,required this.index});

  final List<Adhkar> items;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomAppBar(title: items[index].category ?? ''),
              ListView.builder(
                itemBuilder: (context, listindex) {
                  return AdhkarCard(
                    alzekr: items[index].array![listindex].text ?? '',
                    descrption: '',
                  );
                },
                itemCount: items[index].array!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
