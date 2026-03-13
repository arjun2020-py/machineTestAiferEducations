import 'package:flutter/material.dart';

import '../screen/explore/explore_screen.dart';
import '../screen/feed/view/feed_screen.dart';
import '../screen/profile/profile_screen.dart';


class BottomNavProvider extends ChangeNotifier {

  int currentIndex = 0;

  final List<Widget> items = [
    const FeedScreen(),
    const ExploreScreen(),
    const ProfileScreen(),
  ];

  void changeScreenIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}