import 'package:bloodbank/view/routes/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeName = '/chatscreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List myChat = [];
  var myChatController = TextEditingController();
  void chatFunction(String userEmail) {
    setState(() {
      myChat.add(myChatController.text);
      String currentUser = FirebaseAuth.instance.currentUser!.email.toString();

      FirebaseFirestore.instance.collection('chats').doc(userEmail).set({
        'myemail': currentUser,
        'donoremail': userEmail,
        'chat': myChat,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference chats = FirebaseFirestore.instance.collection('chats');
    final userEmail = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          FutureBuilder<DocumentSnapshot>(
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
                        text: "لا توجد رسائل",
                        size: 20,
                      ),
                    ],
                  ));
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  myChat = data['chat'];
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 5 / 7,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data['chat'].length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(
                                top: 10,
                                left: MediaQuery.of(context).size.width * 1 / 5,
                                right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 231, 80, 90),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50)),
                            ),
                            child: TextWidget(
                                text: data['chat'][index],
                                color: Colors.white,
                                size: 16),
                          );
                        }),
                  );
                }
                return const CircularProgressIndicator();
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppbarWidget(text: userEmail),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  onSubmitted: (_) {
                    chatFunction(userEmail);
                    myChatController.clear();
                  },
                  scribbleEnabled: true,
                  controller: myChatController,
                  cursorColor: const Color.fromARGB(255, 231, 80, 90),
                  decoration: InputDecoration(
                    hintText: 'اكتب رسالة',
                    suffixIconColor: const Color.fromARGB(255, 231, 80, 90),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 231, 80, 90),
                          width: 1.0,
                        )),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Color.fromARGB(255, 231, 80, 90),
                      ),
                      onPressed: () {
                        chatFunction(userEmail);
                        myChatController.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 231, 80, 90),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
