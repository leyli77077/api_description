import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop/application/homepage.dart';
import 'package:flutter_shop/application/settings.dart';
import 'package:flutter_shop/screens/home_screens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Eger main-da şeýdip prefs-y Settings(prefs)-e geçirsek
  // Future() hökmän däl Settings-da dili set etmek üçin
  var prefs = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomePageNotifier()..add(LoadEvent()),
      ),
      // her notifiery aýratyn provide etmeli !
      ChangeNotifierProvider(
        create: (_) => Settings(prefs: prefs),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (_, settings, __) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: settings.language,
        supportedLocales: const [
          const Locale('en', 'US'),
          const Locale('tk', 'TK'),
          const Locale('ru', 'RU'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const HomeScreen(),
      );
    });
  }
}
