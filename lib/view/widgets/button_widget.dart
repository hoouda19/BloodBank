import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color textcolor;
  final Color side;
  final Color bakcgroundcolor;
  final VoidCallback fun;
  final bool clickable;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.fun,
      this.textcolor = Colors.white,
      this.side = const Color.fromARGB(255, 231, 80, 90),
      this.bakcgroundcolor = const Color.fromARGB(255, 231, 80, 90),
      this.clickable = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 1 / 15,
        child: ElevatedButton(
          onPressed: clickable ? fun : null,

          style: ElevatedButton.styleFrom(
            backgroundColor: bakcgroundcolor,
            side: clickable
                ? BorderSide(width: 2.0, color: side)
                : BorderSide(color: Colors.grey),
            shape: const StadiumBorder(),
          ),
          // padding: EdgeInsets.all(16),
          // shape: CircleBorder(),
          // color: Colors.red,
          //backgroundColor: Colors.greenAccent,
          child: Text(
            text,
            style: TextStyle(
                color: textcolor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
