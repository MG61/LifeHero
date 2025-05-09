import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lifehero/Auth/LoginView.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Intl
  await initializeDateFormatting('ru_RU', null);

  runApp(MaterialApp(
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ru', 'RU'), // Русская локаль
      Locale('en', 'US'), // Английская локаль (по желанию)
    ],
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    home: Scaffold(
      body: LoginView(),
    ),
  ));
}
