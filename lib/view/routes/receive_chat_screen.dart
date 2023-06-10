import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/text_widget.dart';

class ReceiveChatScreen extends StatefulWidget {
  const ReceiveChatScreen({super.key});
  static const routeName = '/receivechatscreen';

  @override
  State<ReceiveChatScreen> createState() => _ReceiveChatScreenState();
}

class _ReceiveChatScreenState extends State<ReceiveChatScreen> {
  List myChat = [];
  var myChatController = TextEditingController();
  String currentUser = FirebaseAuth.instance.currentUser!.email.toString();

  void chatFunction(String userEmail) {
    setState(() {
      myChat.add(myChatController.text);

      FirebaseFirestore.instance.collection('chats').doc(currentUser).set({
        'myemail': userEmail,
        'donoremail': currentUser,
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
              future: chats.doc(currentUser).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextWidget(
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
                  onSubmitted: (_) => chatFunction(userEmail),
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
                      onPressed: () => chatFunction(userEmail),
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
