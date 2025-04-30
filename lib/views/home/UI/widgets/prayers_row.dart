
import 'package:flutter/material.dart';
import 'package:quranapp/views/home/logic/prayers.dart';

class PrayersRow extends StatelessWidget {
  const PrayersRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 35),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: prayers[index].icon),
                Text(prayers[index].name),
                Text(prayers[index].time),
              ],
            ),
          );
        },
        itemCount: prayers.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
