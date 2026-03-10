import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../utils/custom_conts/app_image_conts/app_image_conts.dart';
import '../utils/custom_conts/app_text_const/app_text_const.dart';
import '../utils/custom_widget/custom_text.dart';
import 'cubit/bottom_nav_cubit.dart';

class BottomNavbarScreen extends StatelessWidget {
  BottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(context),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          var cubit = context.read<BottomNavCubit>();
          return Scaffold(
            body: cubit.items[cubit.currentIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SalomonBottomBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) => cubit.changeScreenIndex(index),
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black.withOpacity(0.3),

                items: [
                  SalomonBottomBarItem(
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 3),
                      width: 23,
                      child: Image.asset(
                        feedIcon,
                        color: cubit.currentIndex == 0
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
                        color: cubit.currentIndex == 0
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
                        color: cubit.currentIndex == 3
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
        },
      ),
    );
  }
}
