import 'package:flutter/material.dart';
import 'package:quranapp/core/components/adhkar_card.dart';

class AdhkarListView extends StatelessWidget {
  const AdhkarListView({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:
          (context, index) =>
              AdhkarCard(alzekr: '', descrption: ''),
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
