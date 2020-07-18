import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'modules/app/app_store.dart';
import 'modules/app/local_storage_service.dart';
import 'modules/auth/auth_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = false;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  // Get Firebase ID ### ONLY FOR TESTING ###
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // var token = await _firebaseMessaging.getToken();
  // print("######## Instance ID:\n" + token);

  // Set Intl package locale
  Intl.defaultLocale = 'pt_BR';
  // initializeDateFormatting('pt_BR', null);

  var appStore = new AppStore();
  var localStorageService = new LocalStorageService();
  await appStore.init(localStorageService);

  var authStore = new AuthStore();
  await authStore.init(localStorageService);

  runZoned(
    () {
      runApp(
        MultiProvider(
          providers: [
            Provider<AppStore>(create: (_) => appStore),
            Provider<AuthStore>(create: (_) => authStore),
          ],
          child: App(),
        ),
      );
    },
  ); //onError: Crashlytics.instance.recordError);
}
