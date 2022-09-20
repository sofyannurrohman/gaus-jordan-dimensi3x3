import 'package:flutter/material.dart';
import "../../shared/theme.dart";

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(fontWeight: semiBold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              "Aplikasi Gauss-Jordan merupakan aplikasi sederhana yang dikembangkan dengan tujuan untuk mempermudah menentukan penyelesaian dalam Sistem Persamaan Linear untuk matriks berordo 3x3.",
              style: TextStyle(fontSize: 18, fontWeight: medium),
            ),
            SizedBox(height: 20),
            Text(
              "Gauss Jordan merupakan salah satu metode untuk menyelesaikan suatu persamaan linear dengan mengubah persamaan linear menjadi matriks Augmentasi.",
              style: TextStyle(fontSize: 18, fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}
