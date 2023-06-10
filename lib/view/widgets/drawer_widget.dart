import 'package:flutter/material.dart';

import '../routes/login_screen.dart';
import '../routes/messenge_screen.dart';
import '../routes/request_screen.dart';
import '../routes/search_volunteer_screen.dart';
import 'appbar_homepage_widget.dart';
import 'drawer_button.dart';

class DrawerWidget extends StatelessWidget {
  final String userEmail;
  const DrawerWidget({super.key, this.userEmail = 'مستخدم كا ضيف'});

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
                    userEmail,
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
                  DrawerButton(
                    text: 'الرسائل',
                    icon: Icons.messenger_outline_rounded,
                    ontap: () => Navigator.of(context).pushNamed(
                        MessengeScreen.routeName,
                        arguments: userEmail),
                  ),
                  DrawerButton(
                      text: 'الطلبات',
                      icon: Icons.person_add_alt,
                      ontap: () => Navigator.of(context)
                          .pushNamed(RequestScreen.routeName)),
                  // DrawerButton(
                  //     text: 'مشاركة التطبيق',
                  //     icon: Icons.settings,
                  //     ontap: () => Navigator.of(context)
                  //         .pushNamed(SearchVolunteerScreen.routeName)),
                  DrawerButton(
                      text: 'تسجيل خروج',
                      icon: Icons.logout_rounded,
                      ontap: () => Navigator.of(context)
                          .pushNamed(LogInScreen.routeName)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
