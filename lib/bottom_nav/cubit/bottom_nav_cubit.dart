import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/explore/explore_screen.dart';
import '../screen/feed/view/feed_screen.dart';
import '../screen/profile/profile_screen.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit(this.context) : super(BottomNavInitial()) {
    items = [FeedScreen(), ExploreScreen(), ProfileScreen()];
  }

  BuildContext context;
  late final List<Widget> items;
  int currentIndex = 0;
  void changeScreenIndex(int index) {
    currentIndex = index;
    emit(BottomNavInitial());
  }
}
