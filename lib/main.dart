import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lifehero/Auth/LoginView.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
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
