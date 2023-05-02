import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String lable;
  final bool readOnly;
  final String initText;

  const TextFieldWidget(
      {super.key,
      required this.lable,
      this.readOnly = false,
      required this.initText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            initialValue: initText,
            textAlign: TextAlign.right,
            readOnly: readOnly,
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
    ;
  }
}
