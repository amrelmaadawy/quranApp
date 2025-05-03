import 'package:flutter/material.dart';

class WorshipsCard extends StatelessWidget {
  const WorshipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.black,
          ),
          width: 380,
          height: 40,
        ),
        Positioned(
          top: 1,
          bottom: 1,
          left: 1,
          right: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
            ),
            width: 355,
            height: 40,
          ),
        ),
        Center(
          child: Text(
            'جميع العبادات',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
