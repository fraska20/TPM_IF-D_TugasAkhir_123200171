import 'package:flutter/material.dart';

class KesanPage extends StatefulWidget {
  const KesanPage({Key key}) : super(key: key);

  @override
  State<KesanPage> createState() => _KesanPageState();
}

class _KesanPageState extends State<KesanPage> {
  List<String> panduan = [
    "KESAN : ",
    "Penyampaian materi mudah dipahami dan runtut",
    "PESAN : ",
    "Jangan banyak-banyak tugasnya xixi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: panduan.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  panduan[index],
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ));
  }
}
