import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/screens/Settings/biz_profile_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/delivery_fees_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/password_change_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/payment_types_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/settings_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/user_profile_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/working_hours_screen.dart';
import 'package:kwik_biz_flutter/screens/TabbedScreen/tabbed_screen.dart';
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
    var isLogged = false;
    return GestureDetector(
      // This allows touching outside text fields and then remove focus
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.unfocus();

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kwik Biz',
          theme: darkTheme,
          initialRoute: isLogged ? '/' : '/auth',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => TabbedScreen(),
                  settings: settings,
                );
              case '/settings':
                return MaterialPageRoute(
                  builder: (_) => SettingsScreen(),
                  settings: settings,
                );
              case '/biz-profile':
                return MaterialPageRoute(
                  builder: (_) => BizProfileScreen(),
                  settings: settings,
                );
              case '/payment-types':
                return MaterialPageRoute(
                  builder: (_) => PaymentTypesScreen(),
                  settings: settings,
                );
              case '/working-hours':
                return MaterialPageRoute(
                  builder: (_) => WorkingHoursScreen(),
                  settings: settings,
                );
              case '/delivery-fees':
                return MaterialPageRoute(
                  builder: (_) => DeliveryFeesScreen(),
                  settings: settings,
                );
              case '/user-profile':
                return MaterialPageRoute(
                  builder: (_) => UserProfileScreen(),
                  settings: settings,
                );
              case '/password-change':
                return MaterialPageRoute(
                  builder: (_) => PasswordChangeScreen(),
                  settings: settings,
                );

              default:
                return MaterialPageRoute(
                  builder: (_) => TabbedScreen(),
                  settings: settings,
                );
            }
          }),
    );
  }
}
