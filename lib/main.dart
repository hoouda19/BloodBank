import 'package:bloodbank/view/routes/chat_screen.dart';
import 'package:bloodbank/view/routes/login_screen.dart';
import 'package:flutter/material.dart';

import 'view/routes/check_registration.dart';
import 'view/routes/new_donor_screen.dart';
import 'view/routes/transfusional_screen.dart';
import 'view/routes/find_donor_screen.dart';
import 'view/routes/massenger_screen.dart';
import 'view/routes/onboard_page_screen.dart';
import 'view/routes/search_volunteer_screen.dart';
import 'view/routes/singup_screen.dart';
import 'view/routes/home_screen.dart';

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
            accentColor: const Color.fromARGB(255, 231, 80, 90)),
        fontFamily: 'Almarai',
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => onboardScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SingUpScreen.routeName: (context) => const SingUpScreen(),
        FindDonorScreen.routeName: (context) => const FindDonorScreen(),
        TransfusionalScreen.routeName: (context) => const TransfusionalScreen(),
        ChatScreen.routeName: (context) => const ChatScreen(),
        SearchVolunteerScreen.routeName: (context) =>
            const SearchVolunteerScreen(),
        MessengerScreen.routeName: (context) => const MessengerScreen(),
        LogInScreen.routeName: (context) => const LogInScreen(),
        CheckRegistration.routeName: (context) => const CheckRegistration(),
        NewDonorScreen.routeName: (context) => const NewDonorScreen(),
      },
    );
  }
}
