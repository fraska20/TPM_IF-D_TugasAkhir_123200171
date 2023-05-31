import 'package:flutter/material.dart';

class KesanPage extends StatefulWidget {
  const KesanPage({Key key}) : super(key: key);

  @override
  State<KesanPage> createState() => _KesanPageState();
}

class _KesanPageState extends State<KesanPage> {
  List<String> temp = [
    "KESAN : ",
    "Mata kuliah Teknologi Pembelajaran Mobile telah memberikan pengalaman yang sangat berharga bagi saya. Selama kuliah ini, saya belajar tentang konsep-konsep dasar dalam pengembangan aplikasi mobile serta teknik-teknik pembelajaran yang dapat diimplementasikan dalam konteks mobile.",
    "PESAN : ",
    "Tugasnya jangan banyak-banyak pak xixi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: temp.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  temp[index],
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ));
  }
}
