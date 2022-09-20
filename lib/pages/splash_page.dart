import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gausjordan/pages/menu.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/menu");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo1.png'))),
          ),
          Text("Aplikasi Gaus Jordan\nDimensi 3x3",
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              )),
        ],
      )),
    );
  }
}
