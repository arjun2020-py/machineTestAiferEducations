import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_nav/bottom_nav_screen.dart';
import 'bottom_nav/screen/feed/provider/feed_provider.dart';
import 'bottom_nav/provider/bottom_nav_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => FeedProvider()..getFeedApi(),
        ),

        ChangeNotifierProvider(
          create: (_) => BottomNavProvider(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BottomNavbarScreen(),
    );
  }
}