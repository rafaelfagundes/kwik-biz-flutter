import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/screens/TabBar/tab_bar_screen.dart';
import 'package:kwik_biz_flutter/themes/dark_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Intl package locale
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);

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
