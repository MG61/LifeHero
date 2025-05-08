import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:lifehero/Auth/LoginView.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    home: Scaffold(
      body: LoginView(),
    ),
  ));
}
