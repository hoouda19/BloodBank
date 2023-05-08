import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bloodbank/view/widgets/text_widget.dart';
import '../widgets/appbar_homepage_widget.dart';
import '../widgets/blood_widget.dart';
import '../widgets/text_field_widget.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, this.userEmail = 'مستخدم كا ضيف'});

  final String userEmail;
  bool readOnly = true;
  String readOnlyText = 'تعديل';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future getDocs() async {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("collection").get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];
        print(a.data());
      }
    }

    users;
    return SizedBox(
      width: double.infinity,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: 4,
            child: AppbarHomePageWidget(
                isButton: true,
                picture: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 231, 80, 90),
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'asset/images/person.png',

                              // height: MediaQuery.of(context).size.height * 0.03, //image size
                            ),
                          ),
                        ),
                        const BloodWidget(
                            bloodTybe:
                                'A+') // this widget to show the blood type
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    TextWidget(
                      text: widget.userEmail,
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ))), //AppBar Widget
        Expanded(
          flex: 8,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(widget.userEmail).get(),
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
                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Row(
                          children: [
                            TextButton(
                                onPressed: getDocs,
                                child: const Text('buttin')),
                            TextButton(
                                onPressed: () async {
                                  // print('object');
                                  // QuerySnapshot querySnapshot =
                                  //     await FirebaseFirestore.instance
                                  //         .collection("users")
                                  //         .get();
                                  // var list =
                                  //     querySnapshot.docs[0].data();

                                  // print(list);

                                  setState(() {
                                    widget.readOnly = !widget.readOnly;
                                  });
                                },
                                child: Text(widget.readOnly ? 'تعديل' : 'تم')),
                          ],
                        ),
                        TextFieldWidget(
                            lable: 'الاسم',
                            readOnly: widget.readOnly,
                            initText: data['name'].toString()),
                        TextFieldWidget(
                            lable: 'البريد الالكتروني',
                            readOnly: widget.readOnly,
                            initText: data['email'].toString()),
                        TextFieldWidget(
                            lable: 'رقم الهاتف',
                            readOnly: widget.readOnly,
                            initText: data['number'].toString()),
                        TextFieldWidget(
                            lable: 'المدينة/المنطقة',
                            readOnly: widget.readOnly,
                            initText: data['city'].toString()),
                        TextFieldWidget(
                            lable: 'فصيله الدم',
                            readOnly: widget.readOnly,
                            initText: data['bloodtype'].toString()),
                      ],
                    );
                  }

                  return const CircularProgressIndicator();
                },
              )),
        ),
      ]),
    );
  }
}
