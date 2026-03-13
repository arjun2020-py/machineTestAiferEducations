import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../utils/custom_conts/app_image_conts/app_image_conts.dart';
import '../utils/custom_conts/app_text_const/app_text_const.dart';
import '../utils/custom_widget/custom_text.dart';
import 'provider/bottom_nav_provider.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavProvider>();

    return Scaffold(
      body: provider.items[provider.currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SalomonBottomBar(
          currentIndex: provider.currentIndex,
          onTap: (index) => provider.changeScreenIndex(index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black.withOpacity(0.3),

          items: [
            SalomonBottomBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 3),
                width: 23,
                child: Image.asset(
                  feedIcon,
                  color: provider.currentIndex == 0
                      ? const Color(0xFF03b6d2)
                      : const Color(0xffB6BFCA),
                ),
              ),
              title: CustomText(text: feed),
            ),

            SalomonBottomBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 3),
                width: 23,
                child: Icon(
                  Icons.image,
                  color: provider.currentIndex == 1
                      ? const Color(0xFF03b6d2)
                      : const Color(0xffB6BFCA),
                ),
              ),
              title: CustomText(text: feed),
            ),

            SalomonBottomBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 3),
                width: 23,
                child: Image.asset(
                  profileIcon,
                  color: provider.currentIndex == 2
                      ? const Color(0xFF03b6d2)
                      : const Color(0xffB6BFCA),
                ),
              ),
              title: CustomText(text: profile),
            ),
          ],
        ),
      ),
    );
  }
}
