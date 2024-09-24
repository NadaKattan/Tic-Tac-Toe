import 'package:flutter/material.dart';

import 'board_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO game',
      routes: {
        MainScreen.routeName:(_)=>MainScreen(),
        BoardScreen.routeName:(_)=>BoardScreen(),
      },
      initialRoute: MainScreen.routeName,
      // home: const BoardScreen(),
    );
  }
}
