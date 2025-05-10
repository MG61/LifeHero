import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Widget/Navigation.dart';
import 'firebase_options.dart';
import 'Auth/LoginView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase и intl инициализация
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('ru_RU', null);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Пока проверяется состояние — можно показать splash
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // Пользователь авторизован
          return NavigationView();
        } else {
          // Пользователь не авторизован
          return LoginView();
        }
      },
    );
  }
}
