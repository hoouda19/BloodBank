import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../routes/login_screen.dart';
import '../routes/messenge_screen.dart';
import '../routes/request_screen.dart';
import 'appbar_homepage_widget.dart';
import 'drawer_button.dart' as drawer;

class DrawerWidget extends StatefulWidget {
  final String userEmail;
  const DrawerWidget({super.key, this.userEmail = 'مستخدم كا ضيف'});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String name = 'Geust';
  final users = FirebaseFirestore.instance.collection('users');
  void fireStore() async {
    final snapshot = await users.doc(widget.userEmail).get();
    final data = snapshot.data()!;
    setState(() {
      name = data['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    fireStore();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 3 / 5,
      child: Column(
        children: [
          AppbarHomePageWidget(
            round: 100,
            isButton: false,
            picture: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  drawer.DrawerButton(
                    text: 'الرسائل',
                    icon: Icons.messenger_outline_rounded,
                    ontap: () => Navigator.of(context).pushNamed(
                        MessengeScreen.routeName,
                        arguments: widget.userEmail),
                  ),
                  drawer.DrawerButton(
                      text: 'الطلبات',
                      icon: Icons.person_add_alt,
                      ontap: () => Navigator.of(context)
                          .pushNamed(RequestScreen.routeName)),
                  // DrawerButton(
                  //     text: 'مشاركة التطبيق',
                  //     icon: Icons.settings,
                  //     ontap: () => Navigator.of(context)
                  //         .pushNamed(SearchVolunteerScreen.routeName)),
                  drawer.DrawerButton(
                      text: 'تسجيل خروج',
                      icon: Icons.logout_rounded,
                      ontap: () => FirebaseAuth.instance.signOut()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
