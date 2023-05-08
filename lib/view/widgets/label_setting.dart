import 'package:flutter/material.dart';

Widget lableSetting({
  required String lable,
  required String? Function(String?)? validator,
  bool readOnly = false,
  bool obsecure = false,
  required TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          // initialValue: initText,
          textAlign: TextAlign.right,
          readOnly: readOnly,
          validator: validator,
          obscureText: obsecure,
          decoration: InputDecoration(
              label: Text(
            lable,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          )),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
