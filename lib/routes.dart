import 'package:flutter/material.dart';
import 'package:project_uts_azwar/Screens/Login/LoginScreens.dart';
import 'package:project_uts_azwar/Screens/Register/Registrasi.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};
