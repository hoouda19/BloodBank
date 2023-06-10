import 'package:bloodbank/view/routes/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bloodbank/view/widgets/text_widget.dart';
import '../widgets/appbar_widget.dart';

class SearchVolunteerScreen extends StatelessWidget {
  const SearchVolunteerScreen({Key? key}) : super(key: key);
  static const routeName = '/searchvolunteerscreen';

  @override
  Widget build(BuildContext context) {
    final userEmail = ModalRoute.of(context)!.settings.arguments as String;

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .where('donor', isEqualTo: 'true')
    //     .get()
    //     .then(
    //   (value) {
    //     for (int i = 0; i < value.docs.length; i++)
    //       print(value.docs[i].data().values);
    //   },
    // );
    // var users = FirebaseFirestore.instance
    //     .collection('users')
    //     .where('donor', isEqualTo: 'true');

    return Scaffold(
      body: Column(
        children: [
          const AppbarWidget(text: 'البحث عن متبرع'),
          Expanded(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where(
                        'donor',
                        isEqualTo: 'true',
                      )
                      .where('bloodtype', isEqualTo: userEmail)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return ListView(
                      children: snapshot.data!.docs.map((e) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.all(20),
                          height: 170,
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
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextWidget(
                                    text: e['name'].toString(),
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  TextWidget(
                                      text: e['city'].toString(),
                                      size: 16,
                                      color: Colors.grey),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await launchUrl(
                                          Uri(
                                              scheme: 'tel',
                                              path: e['number'].toString()),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurStyle: BlurStyle.outer,
                                                spreadRadius: 1,
                                                blurRadius: 5),
                                          ]),
                                      child: const Center(
                                          child: Icon(
                                        Icons.call,
                                        color: Color.fromARGB(255, 231, 80, 90),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      // FirebaseFirestore.instance
                                      //     .collection('chats')
                                      //     .doc(e['email'])
                                      //     .set({
                                      //   'chat': ['', '']
                                      // });
                                      Navigator.of(context).pushNamed(
                                          ChatScreen.routeName,
                                          arguments: e['email'].toString());
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurStyle: BlurStyle.outer,
                                                spreadRadius: 1,
                                                blurRadius: 5),
                                          ]),
                                      child: const Center(
                                          child: Icon(
                                        Icons.message_outlined,
                                        color: Color.fromARGB(255, 231, 80, 90),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () async {
                                      await launchUrl(
                                          Uri.parse(
                                              'https://wa.me/20${e['number'].toString()}'),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurStyle: BlurStyle.outer,
                                                spreadRadius: 1,
                                                blurRadius: 5),
                                          ]),
                                      child: Center(
                                          child: Image.asset(
                                              'asset/images/whatsapp.png')),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}


                        // shrinkWrap: true,
                        // itemBuilder: (context, index) => Container(
                        //       margin: const EdgeInsets.symmetric(
                        //           horizontal: 20, vertical: 10),
                        //       padding: const EdgeInsets.all(20),
                        //       height: 120,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(25),
                        //           boxShadow: const [
                        //             BoxShadow(
                        //                 color: Colors.black12,
                        //                 blurStyle: BlurStyle.outer,
                        //                 spreadRadius: 1,
                        //                 blurRadius: 1),
                        //           ]),
                        //       width: double.infinity,
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 vertical: 8.0),
                        //             child: Image.asset(
                        //               'asset/images/person.png',
                        //               width: 50,
                        //               height: 50,
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 13,
                        //           ),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               SizedBox(
                        //                 height: 5,
                        //               ),
                        //               TextWidget(
                        //                 text: data['name'].toString(),
                        //                 size: 18,
                        //               ),
                        //               SizedBox(
                        //                 height: 13,
                        //               ),
                        //               TextWidget(
                        //                   text: 'المنصورة /  طلخا ',
                        //                   size: 16,
                        //                   color: Colors.grey),
                        //             ],
                        //           ),
                        //           const Spacer(),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               InkWell(
                        //                 onTap: () {},
                        //                 child: Container(
                        //                   height: 35,
                        //                   width: 50,
                        //                   decoration: BoxDecoration(
                        //                       borderRadius:
                        //                           BorderRadius.circular(25),
                        //                       boxShadow: const [
                        //                         BoxShadow(
                        //                             color: Colors.black12,
                        //                             blurStyle: BlurStyle.outer,
                        //                             spreadRadius: 1,
                        //                             blurRadius: 5),
                        //                       ]),
                        //                   child: const Center(
                        //                       child: Icon(
                        //                     Icons.call,
                        //                     color: Color.fromARGB(
                        //                         255, 231, 80, 90),
                        //                   )),
                        //                 ),
                        //               ),
                        //               const SizedBox(height: 10),
                        //               InkWell(
                        //                 onTap: () => Navigator.of(context)
                        //                     .pushNamed(ChatScreen.routeName),
                        //                 child: Container(
                        //                   height: 35,
                        //                   width: 50,
                        //                   decoration: BoxDecoration(
                        //                       borderRadius:
                        //                           BorderRadius.circular(25),
                        //                       boxShadow: const [
                        //                         BoxShadow(
                        //                             color: Colors.black12,
                        //                             blurStyle: BlurStyle.outer,
                        //                             spreadRadius: 1,
                        //                             blurRadius: 5),
                        //                       ]),
                        //                   child: const Center(
                        //                       child: Icon(
                        //                     Icons.message_outlined,
                        //                     color: Color.fromARGB(
                        //                         255, 231, 80, 90),
                        //                   )),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        // separatorBuilder: (_, index) => const SizedBox(),
                        // itemCount: 2);
  //  if (snapshot.hasError) {
  //                     return const Text("Something went wrong");
  //                   }

  //                   if (snapshot.hasData && !snapshot.data!.exists) {
  //                     return Center(
  //                         child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         const TextWidget(
  //                           text: "لم تسجيل بعد ",
  //                           size: 20,
  //                         ),
  //                         TextButton(
  //                             child: const Text('تسجيل الدخول'),
  //                             onPressed: () {}),
  //                       ],
  //                     ));
  //                   }

  //                   if (snapshot.connectionState == ConnectionState.done) {
  //                     
                      
  //                   }

  //                   return const CircularProgressIndicator();



