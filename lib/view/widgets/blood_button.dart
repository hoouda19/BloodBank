import 'package:flutter/material.dart';

import 'text_widget.dart';

class BloodButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  const BloodButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              isSelected ? Border.all(width: 1, color: Colors.red) : Border(),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
          color: Color.fromARGB(200, 255, 230, 236),
        ),
        child: TextWidget(
          text: text,
          // color: Color.fromARGB(255, 231, 80, 90),
          size: 15,
          weight: FontWeight.bold,
          color: isSelected ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}

 


    //  return SizedBox(
    //   width: 70,
    //   height: 50,
    //   child: FilterChip(
    //     label: widget,
    //     selected: true,

    //     selectedColor: const Color.fromARGB(255, 231, 80, 90),
    //     // labelStyle: const TextStyle(fontSize: 50, color: Colors.green),
    //     onSelected: (bool value) {},
    //   ),
    // );

    // SizedBox(
    //   width: 70,
    //   height: 50,
    //   child: MaterialButton(
    //     onPressed: onPressed,
    //     color: const Color.fromARGB(200, 255, 230, 236),
    //     textColor: Colors.white,
    //     padding: const EdgeInsets.all(16),
    //     shape: const CircleBorder(),
    //     child: widget,
    //   ),
    // );