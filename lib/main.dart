import 'package:flutter/material.dart';

import 'view/routes/find_donor.dart';
import 'view/routes/onboard_page_view.dart';
import 'view/routes/singup_screen.dart';
import 'view/routes/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Bank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: const MaterialColor(
              0xffE7505A,
              <int, Color>{
                50: Color.fromARGB(255, 231, 80, 90),
                100: Color.fromARGB(255, 231, 80, 90),
                200: Color.fromARGB(255, 231, 80, 90),
                300: Color.fromARGB(255, 231, 80, 90),
                400: Color.fromARGB(255, 231, 80, 90),
                500: Color.fromARGB(255, 231, 80, 90),
                600: Color.fromARGB(255, 231, 80, 90),
                700: Color.fromARGB(255, 231, 80, 90),
                800: Color.fromARGB(255, 231, 80, 90),
                900: Color.fromARGB(255, 231, 80, 90),
              },
            ),
            accentColor: Color.fromARGB(255, 231, 80, 90)),
        fontFamily: 'Almarai',
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => onboardPageView(),
        HomePage.routeName: (context) => const HomePage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        FindDonor.routeName: (context) => const FindDonor(),
      },
    );
  }
}
