import 'package:flutter/material.dart';
import 'package:project_uts_azwar/Components/Login/LoginForm.dart';
import 'package:project_uts_azwar/utils/constants.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../size_config.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  _LoginComponent createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SimpleShadow(
              opacity: 0.5,
              color: kSecondaryColor,
              offset: const Offset(5, 5),
              sigma: 2,
              child: Image.asset(
                "assets/icons/shark.png",
                height: 150,
                width: 202,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login !",
                    style: mTitleStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SignInform()
          ],
        ),
      ),
    );
  }
}
