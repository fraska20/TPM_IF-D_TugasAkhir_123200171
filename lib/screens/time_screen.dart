import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class Kalender extends StatefulWidget {
  const Kalender({Key key}) : super(key: key);

  @override
  State<Kalender> createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  DateTime _dateTime = DateTime.now();
  String _timezone = 'Asia/Jakarta';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
    });
    Future.delayed(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime);
  }

  String _formatDate(DateTime dateTime, String timezone) {
    tz.TZDateTime time = tz.TZDateTime.from(dateTime, tz.getLocation(timezone));
    DateFormat formatter = DateFormat('EEEE, dd MMMM');
    return formatter.format(time);
  }

  String _formatTime(DateTime dateTime, String timezone) {
    tz.TZDateTime time = tz.TZDateTime.from(dateTime, tz.getLocation(timezone));
    DateFormat formatter = DateFormat('HH:mm:ss');
    return formatter.format(time);
  }

  void _changeTimezone(String timezone) {
    setState(() {
      _timezone = timezone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Clock", style: TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            Text(_formatTime(_dateTime, _timezone),
                style: TextStyle(fontSize: 64, color: Colors.white)),
            Text(_formatDate(_dateTime, _timezone),
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            Text("Timezone",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(_timezone,
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.blue[400], // Ubah warna latar belakang di sini
                  ),
                  onPressed: () => _changeTimezone('Asia/Jakarta'),
                  child: Text('WIB'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.blue[400], // Ubah warna latar belakang di sini
                  ),
                  onPressed: () => _changeTimezone('Asia/Makassar'),
                  child: Text('WITA'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.blue[400], // Ubah warna latar belakang di sini
                  ),
                  onPressed: () => _changeTimezone('Asia/Jayapura'),
                  child: Text('WIT'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.blue[400], // Ubah warna latar belakang di sini
                  ),
                  onPressed: () => _changeTimezone('Europe/London'),
                  child: Text('London'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
