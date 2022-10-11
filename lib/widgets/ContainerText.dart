import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainText extends StatelessWidget {
  final String? text;
  final double? width,height,fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;
    ContainText(this.text,{Key? key, this.width, this.height, this.fontSize, this.fontColor, this.fontWeight, this.fontStyle, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,

      child: SelectableText(
        text??"",
        maxLines: 2,
        style:textStyle ?? GoogleFonts.poppins(
          color: fontColor,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
        ),
       // textAlign: TextAlign.start,
        onTap: () => print('Tapped'),
      ),
    );
  }
}
