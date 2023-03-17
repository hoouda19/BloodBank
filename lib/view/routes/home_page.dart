import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/container_tap.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_button.dart';
import 'find_donor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/hommepage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 3 / 5,
          child: Column(
            children: [
              AppbarWidget(
                round: 100,
                isButton: false,
                picture: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DrawerButton(
                          text: 'الرسائل',
                          icon: Icons.messenger_outline_rounded),
                      DrawerButton(
                          text: 'الطلبات', icon: Icons.bakery_dining_rounded),
                      DrawerButton(text: 'الاعدادات', icon: Icons.settings),
                      DrawerButton(
                          text: 'تسجيل خروج', icon: Icons.logout_rounded),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 4,
                    child: AppbarWidget(
                      isButton: true,
                      picture: Image.asset(
                        'asset/images/homebar.png',
                        // height: MediaQuery.of(context).size.height * 0.03, //image size
                      ),
                    )), //AppBar Widget
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //ContainerMariem
                          homeContainerTap(
                            image: 'asset/images/home.png',
                            text: 'ابحث عن متبرع',
                            context: context,
                            onTap: () => Navigator.of(context)
                                .pushNamed(FindDonor.routeName),
                          ),
                          homeContainerTap(
                              image: 'asset/images/home1.png',
                              text: 'اتبرع بالدم',
                              context: context,
                              onTap: () {}),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      homeContainerTap(
                          image: 'asset/images/home3.png',
                          text: 'مشاركة التطبيق',
                          context: context,
                          onTap: () {
                            print('object');
                          }),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 80, 90),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2.5,
                                    blurRadius: 20),
                              ]),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: const Center(
                              child: Text(
                            'نصائح وارشادات',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent.shade200,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2.5,
                                  blurRadius: 20),
                            ]),
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: CurvedNavigationBar(
                          index: 2,
                          color: const Color.fromARGB(255, 247, 194, 192),
                          backgroundColor: Colors.white,
                          items: const [
                            FaIcon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                            ),
                            FaIcon(
                              FontAwesomeIcons.houseChimney,
                              color: Colors.red,
                            ),
                          ],
                          onTap: (value) {},
                        )),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
