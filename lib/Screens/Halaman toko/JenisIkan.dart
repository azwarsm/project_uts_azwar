import 'package:flutter/material.dart';
import 'package:project_uts_azwar/Screens/Halaman%20toko/IkanChanna.dart';
import 'package:project_uts_azwar/Screens/Halaman%20toko/ikanlaut.dart';
import 'package:project_uts_azwar/Screens/Login/LoginScreens.dart';

import '../../size_config.dart';
import '../../utils/constants.dart';
import '../../utils/constants.dart';

class JenisIkan extends StatefulWidget {
  const JenisIkan({super.key});

  @override
  State<JenisIkan> createState() => _MyAppState();
}

class _MyAppState extends State<JenisIkan> {
  @override
  Widget build(BuildContext context) {
    var entries = <String>[
      'Ikan Channa',
      'Ikan Cupang',
      //'Ikan Hiu',
      //'Ikan Paus Orca',
      //'Ikan Aligator',
      //'Ikan Guppy',
      //'Ikan Oscar',
      //'Ikan Kamu'
    ];
    var images = ["assets/icons/ikan channa.png", "assets/icons/shark.png"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Jenis Ikan"),
        backgroundColor: Color.fromARGB(255, 12, 202, 223),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 12, 202, 223),
              ),
              accountName: Text(
                "Azwar Syifa Mufiqi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "azwarfiqi690@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: Image.asset('assets/icons/azwar2.png'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IkanChanna()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 12, 202, 223),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/icons/toman2.png",
                        width: 150,
                      ),
                      Text(
                        "Ikan Air Tawar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ikanlaut()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 12, 202, 223),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/nemo.png"),
                      Text(
                        "Ikan Air Asin",
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 244, 244),
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
          ),
        ),
      ),
    );
  }
}
