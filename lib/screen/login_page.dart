import 'package:flafee/screen/dashboard.dart';
import 'package:flafee/theme.dart';
import 'package:flafee/widget/button_widget.dart';
import 'package:flafee/widget/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/widget_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double heightScreen;
  late double widthScreen;

  @override
  Widget build(BuildContext context) {
    heightScreen = MediaQuery.of(context).size.height;
    widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppPallete.background,
      body: Center(
        child: Container(
          height: heightScreen * 0.6,
          width: widthScreen * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: AppPallete.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TxtCustom(
                  tittle: "Flaafee",
                  color: AppPallete.main,
                  fontSize: 48,
                  fontWeight: FontWeight.w800),
              TxtCustom(
                tittle: "Your Coffee Stop",
                alignment: TextAlign.start,
                fontWeight: FontWeight.w700,
              ),
              Gap(50),
              SizedBox(
                  width: widthScreen * 0.3,
                  child: InputForm(
                      tittle: "Username", hinttext: "Enter your username")),
              Gap(20),
              SizedBox(
                width: widthScreen * 0.3,
                child: InputForm(
                  tittle: "Password",
                  hinttext: "Enter your password",
                  obscure: true,
                ),
              ),
              Gap(30),
              SizedBox(
                width: widthScreen * 0.3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtonWidget(
                      tittle: "Login",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dashboard(),
                            ));
                      },
                      height: 50,
                      width: 170,
                      color: AppPallete.main),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
