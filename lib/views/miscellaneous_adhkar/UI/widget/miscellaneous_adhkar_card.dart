import 'package:flutter/material.dart';
import 'package:quranapp/core/model/adhkar/adhkar.dart';
import 'package:quranapp/views/miscellaneous_adhkar/UI/widget/adhkar_miscellaneous_item.dart';

class MiscellaneousAdhkarCard extends StatelessWidget {
  const MiscellaneousAdhkarCard({super.key, required this.items,required this.index});

  final List<Adhkar> items;
  final int index;
  @override
  Widget build(BuildContext context) {
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
                  return AdhkarMiscellaneousItem(items: items, index: index);
                },
              ),
            );
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back),

              Spacer(),
              Text(items[index].category ?? '', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
