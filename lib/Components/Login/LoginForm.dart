import 'package:flutter/material.dart';
import 'package:project_uts_azwar/Screens/Register/Registrasi.dart';
import 'package:project_uts_azwar/utils/constants.dart';

import '../../Screens/Halaman toko/JenisIkan.dart';
import '../../size_config.dart';
import '../custom_surfix_icon.dart';
import '../default_button_custome_color.dart';

class SignInform extends StatefulWidget {
  const SignInform({super.key});

  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInform> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remeber = false;

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUsername(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remeber,
                  onChanged: (value) {
                    setState(() {
                      remeber = value;
                    });
                  }),
              const Text("Tetap Masuk"),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "MASUK",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const JenisIkan(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: const Text(
              "Belum Punya Akun? Daftar Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildUsername() {
    return TextFormField(
      controller: txtUserName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukan username anda',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(
          svgIcon: "assets/images/User.svg",
        ),
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukan password anda',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(
          svgIcon: "assets/images/Lock.svg",
        ),
      ),
    );
  }
}
