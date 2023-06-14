import 'package:flutter/material.dart';
import 'package:project_uts_azwar/routes.dart';
import 'package:project_uts_azwar/theme.dart';

import 'Screens/Login/LoginScreens.dart';

void main() async {
  runApp(MaterialApp(
    title: "Daftar Ikan Hias Mas Azwar",
    theme: theme(),
    initialRoute: LoginScreen.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
  ));
}
