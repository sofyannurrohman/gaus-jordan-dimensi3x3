import 'package:flutter/material.dart';
import "../../shared/theme.dart";

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Petunjuk Penggunaan",
          style: TextStyle(fontWeight: semiBold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "1. Isikan angka-angka di kotak sesuai dengan variabel yang telah tersedia. Anda dapat menggunakan bilangan desimal ataupun negatif sesuai dengan kebutuhan anda.",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
              SizedBox(height: 20),
              Text(
                "2. Pastikan semua kotak yang tersedia telah terisi dengan benar.",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
              SizedBox(height: 20),
              Text(
                "3. Tekan tombol Elim Gauss / Elim Gaus-Jordan sesuai dengan kebutuhan anda.",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
              SizedBox(height: 20),
              Text(
                "4. Hasil akan otomatis tampil, untuk melihat Detail Pengerjaan sepenuhnya scroll ke bawah.",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
              SizedBox(height: 20),
              Text(
                "5. Terdapat tombol reset di kanan atas untuk menghapus semua isian.",
                style: TextStyle(fontSize: 18, fontWeight: medium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
