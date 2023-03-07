import 'package:flutter/material.dart';

homeContainerTap(
    {required String image,
    required String text,
    required BuildContext context,
    required void Function()? onTap,
    double width = 120}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 2.5, blurRadius: 20),
          ]),
      child: Column(children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.1,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Image.asset(image),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    ),
  );
}
