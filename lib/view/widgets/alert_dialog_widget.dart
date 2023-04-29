import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const AlertDialogWidget({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      elevation: 50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromARGB(255, 231, 80, 90),
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Icon(Icons.done),
      //backgroundColor: Colors.,

      content: SizedBox(
        child: Text(
          'تم التسجيل',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23),
        ),
      ), //here man
    );
  }
}
