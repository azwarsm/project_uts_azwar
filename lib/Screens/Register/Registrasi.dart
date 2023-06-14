import 'package:flutter/material.dart';
import 'package:project_uts_azwar/Components/Login/LoginComponent.dart';
import 'package:project_uts_azwar/size_config.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      // body: LoginComponent(),
    );
  }
}
