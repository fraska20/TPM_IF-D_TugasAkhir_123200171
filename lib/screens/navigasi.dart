import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_weather/screens/konversi/explore_screen.dart';
import 'package:flutter_weather/screens/home/home_screen.dart';
import 'package:flutter_weather/screens/tambahan/settings_screen.dart';
import 'package:iconsax/iconsax.dart';

class Navigasi extends StatefulWidget {
  Navigasi({this.locationWeather});

  final locationWeather;

  @override
  _Navigasi createState() => _Navigasi();
}

class _Navigasi extends State<Navigasi> {
  int tabIndex = 0;
  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: IndexedStack(
          index: tabIndex,
          children: [
            HomeScreen(
              locationWeather: widget.locationWeather,
            ),
            ExplorePage(),
            SettingPage()
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: CustomNavigationBar(
          // backgroundColor:
          //     context.theme.bottomNavigationBarTheme.backgroundColor!,
          onTap: (int index) => changeTabIndex(index),
          currentIndex: tabIndex,
          strokeColor: const Color(0x300c18fb),
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Iconsax.cloud_sunny),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Iconsax.global),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Iconsax.setting_2),
            ),
          ],
        ),
      ),
    );
  }
}
