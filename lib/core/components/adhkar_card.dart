import 'package:flutter/material.dart';

class AdhkarCard extends StatelessWidget {
  const AdhkarCard({super.key, required this.alzekr, required this.descrption});
  final String alzekr;
  final String descrption;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
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
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  alzekr,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          //   child: Text(
          //     style: TextStyle(fontSize: 17),

          //     textAlign: TextAlign.right,
          //     descrption,
          //   ),
          // ),
          // SizedBox(height: 15),
          // Center(
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.favorite,
          //       size: 40,
          //       color: AppColor.kprimryColor,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
