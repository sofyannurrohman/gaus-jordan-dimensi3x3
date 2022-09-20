import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../../shared/theme.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  List<Map> menu = [
    {
      "title": "Gauss",
      "icon": "assets/calculator.png",
      "onTap": "/gaus",
      "color": Color(0xff2A0944)
    },
    {
      "title": "Gauss-Jordan",
      "icon": "assets/calculator.png",
      "onTap": "/gausjordan",
      "color": Color(0xff3FA796)
    },
    {
      "title": "Materi",
      "icon": "assets/book.png",
      "onTap": "/materi",
      "color": Color(0xffDFA341)
    },
    {
      "title": "Tentang Aplikasi",
      "icon": "assets/smartphone.png",
      "onTap": "/about",
      "color": Color(0xffA10035)
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(
          "Main Menu",
          style: TextStyle(fontWeight: semiBold),
        ),
      ),
      body: Column(
          children: menu
              .map(
                (e) => Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, e["onTap"]);
                    },
                    child: Container(
                      decoration: BoxDecoration(color: e["color"]),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            e["icon"],
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(e["title"],
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: semiBold))
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
