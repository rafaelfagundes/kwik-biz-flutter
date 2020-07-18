import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kwik_biz_flutter/screens/Settings/biz_profile_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/delivery_fees_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/password_change_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/payment_types_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/settings_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/user_profile_screen.dart';
import 'package:kwik_biz_flutter/screens/Settings/working_hours_screen.dart';
import 'package:kwik_biz_flutter/screens/TabbedScreen/tabbed_screen.dart';
import 'package:kwik_biz_flutter/themes/dark_theme.dart';
import 'package:kwik_biz_flutter/themes/light_theme.dart';
import 'package:provider/provider.dart';

import 'modules/app/app_store.dart';
import 'modules/auth/auth_store.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStore = Provider.of<AppStore>(context);
    final authStore = Provider.of<AuthStore>(context);

    FirebaseAnalytics analytics = FirebaseAnalytics();
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);
    double textScaleFactor = 1.0;

    return Observer(builder: (_) {
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
            builder: (BuildContext context, Widget child) {
              // Disables text resize by OS
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaleFactor: textScaleFactor),
                child: child,
              );
            },
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Locale('pt', 'BR'),
            supportedLocales: [const Locale('pt', 'BR')],
            debugShowCheckedModeBanner: false,
            title: 'Kwik Biz',
            theme: appStore.isDark ? darkTheme : lightTheme,
            navigatorObservers: [
              observer,
            ],
            initialRoute: authStore.isLogged ? '/' : '/auth',
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
    });
  }
}
