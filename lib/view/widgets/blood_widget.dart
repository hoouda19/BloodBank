import 'package:bloodbank/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BloodWidget extends StatelessWidget {
  final String bloodTybe;
  const BloodWidget({super.key, required this.bloodTybe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.asset('asset/images/blood.png'),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextWidget(
                text: bloodTybe,
                size: 15,
                color: Colors.white,
                weight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
