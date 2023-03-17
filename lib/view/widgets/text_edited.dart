// import 'package:flutter/material.dart';



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
