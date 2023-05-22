import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/login_screen.dart';
import 'package:flutter_weather/utilities/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'models/boxes.dart';
import 'models/pengguna.dart';

void main() async {
  Hive.initFlutter();
  tz.initializeTimeZones();
  Hive.registerAdapter(PenggunaAdapter());
  await Hive.openBox<Pengguna>(HiveBoxex.pengguna);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme(
          color: kBackgroundColor,
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
