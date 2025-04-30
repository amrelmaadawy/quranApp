import 'package:flutter/material.dart';
import 'package:quranapp/views/home/UI/widgets/home_appbar.dart';
import 'package:quranapp/views/home/logic/prayers.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HomeAppBar(),
              SizedBox(height: 20),
              SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
