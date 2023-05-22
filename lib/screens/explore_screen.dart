import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/money_screen.dart';
import 'package:flutter_weather/screens/time_screen.dart';
import 'package:flutter_weather/utilities/constants.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 50),
              child: Text(
                'Konversi',
                style: kCityNameTextStyle,
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.blue[400],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrencyConvertPage()),
                  );
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: const Text(
                  'Mata Uang',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.blue[400],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kalender()),
                  );
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: const Text(
                  'Waktu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
