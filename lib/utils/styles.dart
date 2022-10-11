

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

 const Color mainColor = Color.fromARGB(255, 46, 41, 78);
const Color mainGradientColor = Color.fromARGB(255,46, 51, 68);
const Color scaffoldMain = Color.fromARGB(255,233,237,242);
const Color scaffoldSecond = Color.fromARGB(255,250,250,250);


class AppColors {
  static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color ternaryBackground = Color.fromARGB(255, 237, 181, 6);
  static const Color mainColor = Color.fromARGB(255, 49,18,111);

  // elemnts
  static const Color primaryElement = Color(0xff91143b);
  static const Color secondaryElement = Color.fromARGB(255, 233, 233, 233);
  static const Color accentElement = Color(0xffffb900);

  //text
  static const Color primaryText = Color.fromARGB(255, 28, 28, 28);
  static const Color secondaryText = Color(0xff91143b);
  static const Color accentText = Color(0xffffb900);

  static const Color shopText = Color(0xff707070);
}


class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: const Color(0x4d727c8e),
    width: 1,
    style: BorderStyle.solid,
  );
  static const BorderSide secondaryBorder = BorderSide(
    color: Color.fromARGB(255, 209, 165, 75),
    width: 1.5,
    style: BorderStyle.solid,
  );
}

///Gradients

class Gradients {
  static const Gradient mainGradient = LinearGradient(colors: [mainColor, mainGradientColor], begin: Alignment.topRight, end: Alignment.bottomLeft);
  static const Gradient primaryGradient = LinearGradient(colors: [Color(0xff353b3f), Color(0xff191a1d)], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const secandaryGradient = LinearGradient(colors: [Color(0xffFBFBFC), Color(0xffD3DAE7)], stops: [0, 1], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00));

  static const sideBlackGradient = LinearGradient(colors: [Color(0xff191a1d), Color(0xff353b3f)], stops: [0, 1], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00));
  static const scaffoldGradient = LinearGradient(colors: [scaffoldMain, scaffoldSecond], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const fireGradient = LinearGradient(colors: [Color(0xffe0530a), Color(0xffbd2310)], stops: [0, 1], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00));
  static LinearGradient blueGradient =
  LinearGradient(colors: [Colors.lightBlue.withOpacity(.7), Colors.lightBlue.withOpacity(.9)], stops: [0, 1], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00));
  static const backGroundfireGradient = LinearGradient(colors: [Color(0xffbd2310), Color(0xffe0530a)], stops: [0, 1], begin: Alignment(-1.00, 0.00), end: Alignment(1.00, -0.00));
}
 class Decorations{
  static  BoxDecoration mainDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 1,
        //offset: Offset(3, 3),
      ),
    ],
    borderRadius: BorderRadius.circular(14),
    shape: BoxShape.rectangle,
    color: Colors.white,
  );

  static BoxDecoration secondDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 0,
        //offset: Offset(3, 3),
      ),
    ],
    borderRadius: BorderRadius.circular(4),
    shape: BoxShape.rectangle,
    color: Colors.white,
  );
 }


class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(20, 209, 165, 75),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
  static const BoxShadow secondaryShadow = BoxShadow(
    color: Color.fromARGB(20, 0, 0, 0),
    offset: Offset(0, 2),
    blurRadius: 6,
  );
}

class TextStyles {
  static final headerStyle = GoogleFonts.lato(textStyle:  const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  ));
  static final subHeaderStyle = GoogleFonts.lato(textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  ));

  static final whiteTextStyle = GoogleFonts.lato(textStyle: const TextStyle(
      color: Colors.white
  ));
  static final blackTextStyle = GoogleFonts.lato(textStyle: const TextStyle(
      color: Colors.black
  ));
}