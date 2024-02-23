import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/appbar_homepage_widget.dart';
import '../widgets/container_tap.dart';
import 'find_donor_screen.dart';
import 'instruction_screen.dart';
import 'new_donor_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final userEmail = ModalRoute.of(context)!.settings.arguments as String;
    return SizedBox(
      width: double.infinity,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: 4,
            child: AppbarHomePageWidget(
              isButton: true,
              picture: Image.asset(
                'asset/images/homebar.png',
              ),
            )), //AppBar Widget
        Expanded(
          flex: 8,
          child: Column(
            children: [
              SizedBox(height: mediaQuery.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  homeContainerTap(
                    image: 'asset/images/home1.png',
                    text: 'اتبرع بالدم',
                    context: context,
                    onTap: () => Navigator.of(context).pushNamed(
                        NewDonorScreen.routeName,
                        arguments: userEmail),
                  ),
                  homeContainerTap(
                    image: 'asset/images/home.png',
                    text: 'ابحث عن متبرع',
                    context: context,
                    onTap: () => Navigator.of(context)
                        .pushNamed(FindDonorScreen.routeName),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.05),
              homeContainerTap(
                  image: 'asset/images/home3.png',
                  text: 'مشاركة التطبيق',
                  context: context,
                  onTap: () async {
                    await Share.share('https://bloodband/app.com');
                  }),
              SizedBox(height: mediaQuery.height * 0.03),
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(InstructionsScreen.routeName),
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
                  height: mediaQuery.height * 0.07,
                  width: mediaQuery.width * 0.35,
                  child: const Center(
                      child: Text(
                    'نصائح وارشادات',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
