import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/text_widget.dart';
import 'chat_screen.dart';

class MessengeScreen extends StatelessWidget {
  static const routeName = '/messengescreen';

  const MessengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppbarWidget(text: 'الرسائل'),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ChatScreen.routeName),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.all(20),
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurStyle: BlurStyle.outer,
                                      spreadRadius: 1,
                                      blurRadius: 1),
                                ]),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Image.asset(
                                    'asset/images/person.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextWidget(
                                      text: 'نيفين ياسر  A+',
                                      size: 18,
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    TextWidget(
                                        text:
                                            'مرحبا اريد معرفه المزيدمن المعلومات ',
                                        size: 16,
                                        color: Colors.grey),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (_, index) => const SizedBox(),
                    itemCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
