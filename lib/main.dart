import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'view/routes/chat_screen.dart';
import 'view/routes/login_screen.dart';
import 'view/routes/main_screen.dart';
import 'view/routes/check_registration_screen.dart';
import 'view/routes/instruction_screen.dart';
import 'view/routes/messenge_screen.dart';
import 'view/routes/nearby_hospitals_details_screen.dart';
import 'view/routes/nearby_hospitals_screen.dart';
import 'view/routes/new_donor_screen.dart';
import 'view/routes/transfusional_screen.dart';
import 'view/routes/find_donor_screen.dart';
import 'view/routes/request_screen.dart';
import 'view/routes/onboard_page_screen.dart';
import 'view/routes/search_volunteer_screen.dart';
import 'view/routes/singup_screen.dart';
import 'view/routes/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        MainScreen.routeName: (context) => const MainScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        NearbyHospitalsScreen.routeName: (context) =>
            const NearbyHospitalsScreen(),
        SingUpScreen.routeName: (context) => SingUpScreen(),
        FindDonorScreen.routeName: (context) => FindDonorScreen(),
        TransfusionalScreen.routeName: (context) => const TransfusionalScreen(),
        ChatScreen.routeName: (context) => const ChatScreen(),
        SearchVolunteerScreen.routeName: (context) =>
            const SearchVolunteerScreen(),
        RequestScreen.routeName: (context) => const RequestScreen(),
        LogInScreen.routeName: (context) => LogInScreen(),
        CheckRegistrationScreen.routeName: (context) =>
            const CheckRegistrationScreen(),
        NewDonorScreen.routeName: (context) => const NewDonorScreen(),
        MessengeScreen.routeName: (context) => const MessengeScreen(),
        InstructionsScreen.routeName: (context) => const InstructionsScreen(),
        NearbyHospitalsDetailsScreen.routeName: (context) =>
            const NearbyHospitalsDetailsScreen(),
      },
    );
  }
}
