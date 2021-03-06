import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:nuntium/config/themes.dart';
import 'package:nuntium/core/services/locator.dart';
import 'package:nuntium/ui/views/home.dart';
import 'package:nuntium/ui/views/login.dart';
import 'package:nuntium/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupServiceLocator();
  runApp(Nuntium());
}

class Nuntium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'nuntium',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: Platform.isAndroid || Platform.isIOS ? oledTheme : darkTheme,
        initialRoute: 'login',
        routes: {
          'home': (context) => HomeView(),
          'login': (context) => LoginView(),
        },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
