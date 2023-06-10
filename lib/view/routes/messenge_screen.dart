import 'package:bloodbank/view/routes/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/text_widget.dart';
import 'chat_screen.dart';
import 'receive_chat_screen.dart';

class MessengeScreen extends StatelessWidget {
  static const routeName = '/messengescreen';

  const MessengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmail = ModalRoute.of(context)!.settings.arguments as String;
    CollectionReference chats = FirebaseFirestore.instance.collection('chats');
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
            future: chats.doc(userEmail).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "لم تسجيل بعد ",
                      size: 20,
                    ),
                    TextButton(
                        child: const Text('تسجيل الدخول'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(LogInScreen.routeName)),
                  ],
                ));
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    const AppbarWidget(text: 'الرسائل'),
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed(
                                      ReceiveChatScreen.routeName,
                                      arguments: data['myemail']),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    padding: const EdgeInsets.all(20),
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.red.withOpacity(0.8),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurStyle: BlurStyle.outer,
                                              spreadRadius: 1,
                                              blurRadius: 1),
                                        ]),
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Image.asset(
                                            'asset/images/person.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 13,
                                        ),
                                        TextWidget(
                                          text: data['myemail'],
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (_, index) => const SizedBox(),
                            itemCount: 1),
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
