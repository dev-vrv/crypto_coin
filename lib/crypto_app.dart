import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'theme/theme_dark.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeDark,
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
