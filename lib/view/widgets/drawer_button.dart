import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final IconData icon;
  const DrawerButton(
      {super.key, required this.text, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(120, 255, 230, 236),
            borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(text),
                    Icon(icon),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
