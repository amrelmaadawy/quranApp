
import 'package:flutter/material.dart';
import 'package:quranapp/core/app_color.dart';

class AdhkarCard extends StatelessWidget {
  const AdhkarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
      
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  textAlign: TextAlign.right,
                  '(اللَّهُمَّ اجْعَلْ فِي قَلْبِي نُوراً، وَفِي لِسَانِي نُوراً، وَفِي سَمْعِي نُوراً، وَفِي بَصَرِي نُوراً، وَمِنْ فَوْقِي نُوراً، وَمِنْ تَحْتِي نُوراً، وَعَنْ يَمِينِي نُوراً، وَعَنْ شِمَالِي نُوراً، وَمِنْ أَمَامِي نُوراً، وَمِنْ خَلْفِي نُوراً، وَاجْعَلْ فِي نَفْسِي نُوراً، وَأَعْظِمْ لِي نُوراً، وَعَظِّم لِي نُوراً، وَاجْعَلْ لِي نُوراً، وَاجْعَلْنِي نُوراً، اللَّهُمَّ أَعْطِنِي نُوراً، وَاجْعَلْ فِي عَصَبِي نُوراً، وَفِي لَحْمِي نُوراً، وَفِي دَمِي نُوراً، وَفِي شَعْرِي نُوراً، وَفِي بَشَرِي نُوراً) ([اللَّهُمَّ اجْعَلْ لِي نُوراً فِي قَبْرِي... وَنُوراً فِي عِظَامِي])[(وَزِدْنِي نُوراً، وَزِدْنِي نُوراً، وَزِدْنِي نُوراً)] [(وَهَبْ لِي نُوراً عَلَى نُورٍ)]',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              style: TextStyle(fontSize: 17),
      
              textAlign: TextAlign.right,
              'من قالها حين يصبح أجير من الجن حتي يمسي ومن قالها حين يمسي أجير من الجن حتي يصبح',
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: AppColor.kprimryColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
