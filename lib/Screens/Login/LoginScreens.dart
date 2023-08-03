import 'package:flutter/material.dart';
import 'package:project_uts_azwar/Components/Login/LoginComponent.dart';
import 'package:project_uts_azwar/size_config.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Daftar Ikan Hias Azwar")),
        backgroundColor: Color.fromARGB(255, 133, 227, 227),
      ),
      body: const LoginComponent(),
    );
  }
}
