import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage('images/foto.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Muhammad Davin Fraska Buana',
                                style: TextStyle(fontSize: 16),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                '123200171',
                                style: TextStyle(fontSize: 16),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
    );
  }
}
