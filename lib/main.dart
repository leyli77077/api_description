import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop/application/homepage.dart';
import 'package:flutter_shop/application/settings.dart';
import 'package:flutter_shop/core/l10n.dart';
import 'package:flutter_shop/screens/home_screens.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Eger main-da şeýdip prefs-y Settings(prefs)-e geçirsek
  // Future() hökmän däl Settings-da dili set etmek üçin
  var prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageNotifier()..add(LoadEvent()),
        ),
        ChangeNotifierProvider(
          create: (_) => Settings(prefs: prefs),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (_, settings, __) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: settings.language,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('tk', 'TM'),
          Locale('ru', 'RU'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          TmCupertinoLocalizations.delegate,
          TmMaterialLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
        ],
        
        home: const HomeScreen(),
      );
      
    }
    );
    
  }
  
}
