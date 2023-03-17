import 'package:flutter/material.dart';

Widget lableSetting(
    {required String lable,
    required String initText,
    required String? Function(String?)? validator,
    bool obsecure = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          initialValue: initText,
          textAlign: TextAlign.right,
          validator: validator,
          obscureText: obsecure,
          decoration: InputDecoration(
              label: Text(
            lable,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          )),
        ),
      ),
      SizedBox(
        height: 15,
      )
    ],
  );
}
