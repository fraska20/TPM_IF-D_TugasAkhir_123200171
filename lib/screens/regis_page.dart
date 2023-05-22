import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/pengguna.dart';
import '../models/boxes.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myBox = HiveBoxex();

  validated() {
    if (_formKey.currentState != null && _formKey.currentState.validate()) {
      _onFormSubmit();
      print("Form Validated");
    } else {
      print("Form not validated");
      return;
    }
  }

  String username;
  String password;

  void _onFormSubmit() async {
    // Box<Pengguna> penggunaBox = Hive.box<Pengguna>(HiveBoxex.pengguna);
    // penggunaBox.add(Pengguna(username: username, password: password));
    await myBox.putData(username, password);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: Column(
            children: [
              Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Lengkapi Data Anda Untuk Mendaftar!",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              SafeArea(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'username',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          validator: (String value) {
                            if (value == null || value.trim().length == 0) {
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          obscureText: true,
                          validator: (String value) {
                            if (value == null || value.trim().length == 0) {
                              return "Required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[400],
                              onPrimary: Colors.white,
                            ),
                            onPressed: () async {
                              // print(username);
                              // var box = Hive.box<Pengguna>(HiveBoxex.pengguna);
                              // var boxusername;
                              // int index = 0;
                              // if (box.values.isEmpty) {
                              //   validated();
                              // } else {
                              //   for (index;
                              //       index < box.values.length;
                              //       index++) {
                              //     Pengguna res = box.getAt(index);
                              //     boxusername = res.username;

                              //     if (username == boxusername) {
                              //       SnackBar snackBar = SnackBar(
                              //           content:
                              //               Text("username sudah digunakan"));
                              //       ScaffoldMessenger.of(context)
                              //           .showSnackBar(snackBar);
                              //     } else {
                              //       index = box.values.length;
                              //       validated();
                              //     }
                              //   }
                              // }
                              String savedPassword =
                                  await myBox.getData('pengguna_${username}');
                              if (savedPassword == null) {
                                validated();
                              } else {
                                SnackBar snackBar = SnackBar(
                                  content: Text("username sudah digunakan"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text('Buat Akun')),
                        SizedBox(height: 24),
                        // _buildButtonSubm it(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
