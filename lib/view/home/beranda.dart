import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/controllers/home_controller.dart';
import '../next-days/components/app_bar.dart';
import '../next-days/next_14_days.dart';
import 'components/container_list.dart';
import 'components/hours_list.dart';
import 'components/info_card.dart';
import 'components/location.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              //-----
              // Map
              //-----
              Location(),
              Hero(
                tag: 'TAG',
                child: Material(
                  color: Colors.transparent,
                  child: InfoCard(),
                ),
              ),
              ContainerList(),
              const SizedBox(
                height: 10,
              ),
              //----------------------
              // Today & Next 14 Days
              //----------------------
              GestureDetector(
                onTap: () => Get.to(() => NextDays()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: const [
                      Text(
                        'Today',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      Text(
                        'Next 14 Days >',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              HoursList(),
            ],
          ),
        ),
      ),
    );
  }
}
