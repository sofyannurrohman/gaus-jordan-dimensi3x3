import 'package:flutter/material.dart';
import "../../shared/theme.dart";

class MateriPage extends StatelessWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Materi",
          style: TextStyle(fontWeight: semiBold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text("Eliminasi Gauss",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: semiBold,
                  )),
              SizedBox(height: 20),
              Text(
                "Eliminasi Gauss adalah suatu metode untuk mengoperasikan nilai-nilai di dalam matriks sehingga menjadi matriks yang lebih sederhana lagi. Dengan melakukan operasi baris sehingga matriks tersebut menjadi matriks yang baris.",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
              SizedBox(height: 30),
              Text("Eliminasi Gauss-Jordan",
                  style: TextStyle(fontSize: 24, fontWeight: semiBold)),
              SizedBox(height: 20),
              Text(
                "Eliminasi Gauss-Jordan adalah prosedur pemecahan sistem persamaan linear dengan mengubahnya menjadi bentuk matriks eselon baris tereduksi dengan Operasi Baris Elementer Operasi Baris Elementer (OBE) merupakan suatu operasi yang diterapkan pada baris suatu matriks. OBE bisa digunakan untuk menentukan invers suatu matriks dan menyelesaikan suatu sistem persamaan linear (SPL).",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
              Image.asset(
                "assets/materi1.jpg",
                width: 400,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
