import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;
double defaultRadius = 17.0;

Color kPrimaryColor = Color(0xff3330E4);
Color kBlackColor = Color(0xff1E1D1D);
Color kWhiteColor = Color(0xffFCF8E8);
Color kGreyColor = Color(0xffE1E0);
Color kGreenColor = Color(0xff0EC3AE);
Color kRedColor = Color(0xffEB70A5);
Color kBackgroundColor = Color(0xff2A0944);
Color kInactiveColor = Color(0xffDBD7EC);
Color kTransparentColor = Colors.transparent;
Color kAvailableColor = Color(0xffE0D9FF);
Color kUnavailableColor = Color(0xffEBECF1);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);
TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

String formatDouble(double d) {
  var s = d.toStringAsFixed(2);
  var sArray = s.split('.');
  if (sArray[1] == '00') {
    return sArray[0];
  } else {
    return s;
  }
}
