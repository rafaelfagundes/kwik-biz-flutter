import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/screens/TabBar/tab_bar_screen.dart';
import 'package:kwik_biz_flutter/themes/dark_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kwik Biz',
        theme: darkTheme,
        home: TabBarScreen());
  }
}
