import 'package:flafee/screen/cashierboard.dart';
import 'package:flafee/theme.dart';
import 'package:flafee/widget/button_widget.dart';
import 'package:flafee/widget/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/png/background.png"),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(
              //     AppPallete.background.withOpacity(0.5), BlendMode.dstATop),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Warna shadow
                spreadRadius: 2, // Seberapa jauh shadow menyebar
                blurRadius: 7, // Seberapa blur shadow
                offset: Offset(0, 3), // Posisi shadow (x, y)
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TxtCustom(
                  tittle: "Flafee",
                  fontSize: 48,
                  color: AppPallete.black,
                  fontWeight: FontWeight.w900,
                ),
                TxtCustom(
                    tittle: "Welcome Back, Please Login ",
                    fontSize: 14,
                    color: AppPallete.black,
                    fontWeight: FontWeight.bold),
                Gap(20),
                Container(
                  width: 350,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppPallete.mainsubsub,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Warna shadow
                        spreadRadius: 1, // Seberapa jauh shadow menyebar
                        blurRadius: 5, // Seberapa blur shadow
                        offset: Offset(10, 10), // Posisi shadow (x, y)
                      ),
                    ],
                  ),
                  child: Column(children: [
                    InputFormLogin(
                      tittle: "Username",
                      hinttext: "Write your username",
                    ),
                    Gap(10),
                    InputFormLogin(
                      tittle: "Password",
                      hinttext: "Write your password",
                      obscure: true,
                    ),
                    Gap(10),
                    ButtonWidget(
                      tittle: "Sign In",
                      onTap: () {
                        Get.toNamed('/cashierboard');
                      },
                      color: AppPallete.main,
                      width: 170,
                      height: 42,
                    ),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
