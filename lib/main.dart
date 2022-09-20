import 'package:gausjordan/pages/about.dart';
import 'package:gausjordan/pages/gaus.dart';
import 'package:gausjordan/pages/gaus_jordan.dart';
import 'package:gausjordan/pages/instruction.dart';
import 'package:gausjordan/pages/materi.dart';
import 'package:gausjordan/pages/menu.dart';
import 'package:gausjordan/pages/splash_page.dart';
import "package:flutter/material.dart";
import 'package:gausjordan/provider/provider.dart';
import 'package:gausjordan/shared/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GausProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/menu": (context) => MenuPage(),
          "/gaus": (context) => GausPage(),
          "/gausjordan": (context) => GausJordanPage(),
          "/about": (context) => About(),
          "/instruction": (context) => InstructionPage(),
          "/materi": (context) => MateriPage()
        },
      ),
    );
  }
}
