import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer_widget.dart';

import 'home_screen.dart';
import 'nearby_hospitals_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/mainscreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int index = 2;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // final userEmail = ModalRoute.of(context)!.settings.arguments as String;
    final firebaseInstance = FirebaseAuth.instance.currentUser!.email;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          color: const Color.fromARGB(255, 247, 194, 192),
          backgroundColor: Colors.white,
          items: const [
            FaIcon(
              FontAwesomeIcons.solidUser,
              color: Colors.red,
            ),
            FaIcon(
              FontAwesomeIcons.solidHospital,
              color: Colors.red,
            ),
            FaIcon(
              FontAwesomeIcons.houseChimney,
              color: Colors.red,
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        endDrawer: DrawerWidget(userEmail: firebaseInstance!),
        backgroundColor: Colors.white,
        body: index == 1
            ? const NearbyHospitalsScreen()
            : index == 2
                ? const HomeScreen()
                : ProfileScreen(userEmail: firebaseInstance),
      ),
    );
  }
}
