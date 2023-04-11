import 'package:bloodbank/view/widgets/drawer_button.dart';
import 'package:flutter/material.dart';

import '../routes/massenger_screen.dart';
import 'appbar_homepage_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

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
                  const Text(
                    'نيفين ياسر محمد',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const DrawerButton(
                        text: 'الرسائل', icon: Icons.messenger_outline_rounded),
                    onTap: () => Navigator.of(context)
                        .pushNamed(MessengerScreen.routeName),
                  ),
                  const DrawerButton(
                      text: 'الطلبات', icon: Icons.bakery_dining_rounded),
                  const DrawerButton(text: 'الاعدادات', icon: Icons.settings),
                  InkWell(
                    child: const DrawerButton(
                        text: 'تسجيل خروج', icon: Icons.logout_rounded),
                    onTap: () => Navigator.of(context)
                        .pushNamed(MessengerScreen.routeName),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
