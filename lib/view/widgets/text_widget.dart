import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textalign;
  final double height;

  const TextWidget(
      {super.key,
      required this.text,
      this.size = 30,
      this.color = Colors.black,
      this.weight = FontWeight.normal,
      this.textalign = TextAlign.right,
      this.height = 1.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textalign,
      style: TextStyle(
          color: color, fontSize: size, fontWeight: weight, height: height),
    );
  }
}


// class TextUtils extends StatelessWidget {
//   final String text;
//   final FontWeight? fontWeight;
//   final double? fontSize;
//   final Color? color;
//   final TextDecoration? underline;
//   final TextOverflow? overFlow;
//   final int? maxLines;

//   const TextUtils({required this.text,
//     this.fontWeight,
//     this.fontSize,
//     this.color,
//     this.underline,
//     this.overFlow,
//     this.maxLines,
//     Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       maxLines: maxLines ,
//       style: GoogleFonts.almarai(

//         textStyle: TextStyle(


//             decoration: underline,
//             fontSize: fontSize ?? 18,
//             fontWeight: fontWeight ?? FontWeight.normal,
//             color: color ?? Colors.black,
//             overflow: TextOverflow.ellipsis,),
//       ),
//     );
//   }
// }
