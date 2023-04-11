import 'package:bloodbank/view/routes/search_volunteer_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeName = '/chatscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 231, 80, 90),
        centerTitle: true,
        title: const TextWidget(
          text: 'الرسائل',
          size: 24,
          color: Colors.white,
        ),
        elevation: 0,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(right: 15, left: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color.fromARGB(255, 231, 80, 90),
                    )),
                child: Row(children: [
                  const TextWidget(
                      text: 'نيفين ياسر', size: 18, weight: FontWeight.bold),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 80, 90),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: const TextWidget(
                    text: 'مرحبا اريد معرفه المزيدمن المعلومات عن المريض',
                    size: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 80, 90),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                child: const TextWidget(
                    text: 'حسنا سوف اخبرك بالمعلومات المطلوبه ', size: 16),
              ),
              const Spacer(),
              TextField(
                cursorColor: const Color.fromARGB(255, 231, 80, 90),
                decoration: InputDecoration(
                  hintText: 'اكتب رسالة',
                  focusColor: const Color.fromARGB(255, 231, 80, 90),
                  fillColor: const Color.fromARGB(255, 231, 80, 90),
                  suffixIconColor: const Color.fromARGB(255, 231, 80, 90),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 231, 80, 90),
                        width: 1.0,
                      )),
                  suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.send_rounded,
                        color: Color.fromARGB(255, 231, 80, 90),
                      )),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 80, 90),
                      width: 1.0,
                    ),
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
