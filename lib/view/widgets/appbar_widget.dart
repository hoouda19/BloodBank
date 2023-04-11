import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String text;
  const AppbarWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 231, 80, 90),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      height: MediaQuery.of(context).size.height * 1 / 6,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
