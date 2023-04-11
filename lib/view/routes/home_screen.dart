import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/container_tap.dart';
import '../widgets/appbar_homepage_widget.dart';
import '../widgets/drawer_button.dart';
import '../widgets/drawer_widget.dart';
import 'find_donor_screen.dart';
import 'massenger_screen.dart';
import 'new_donor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/homescreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 4,
                    child: AppbarHomePageWidget(
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
                          homeContainerTap(
                            image: 'asset/images/home1.png',
                            text: 'اتبرع بالدم',
                            context: context,
                            onTap: () => Navigator.of(context)
                                .pushNamed(NewDonorScreen.routeName),
                          ),
                          //ContainerMariem
                          homeContainerTap(
                            image: 'asset/images/home.png',
                            text: 'ابحث عن متبرع',
                            context: context,
                            onTap: () => Navigator.of(context)
                                .pushNamed(FindDonorScreen.routeName),
                          ),
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
