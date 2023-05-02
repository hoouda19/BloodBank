import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bloodbank/view/routes/check_registration_screen.dart';
import 'package:bloodbank/view/widgets/lable_setting.dart';
import '../widgets/button_widget.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({Key? key}) : super(key: key);
  static const routeName = '/singupscreen';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Image.asset(
            'asset/images/shapes.png',
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                          bottom: MediaQuery.of(context).size.height * 0.07,
                        ),
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        )),
                    lableSetting(
                        lable: 'الاسم الكامل',
                        controller: null,
                        validator: (val) {}),
                    lableSetting(
                        lable: 'عنوان البريد الالكترونى ',
                        controller: emailController,
                        validator: (val) {}),
                    lableSetting(
                        lable: 'كلمة المرور',
                        controller: passwordController,
                        validator: (val) {},
                        obsecure: true),
                    lableSetting(
                        lable: 'رقم الموبايل ',
                        controller: null,
                        validator: (val) {}),
                    lableSetting(
                        lable: 'فصيله الدم ',
                        controller: null,
                        validator: (val) {}),
                    lableSetting(
                        lable: 'المدينه',
                        controller: null,
                        validator: (val) {}),
                    TextButton(
                        child: const Text('لدي حساب'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(LogInScreen.routeName)),
                    TextButton(
                        child: const Text('محمود'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(MainScreen.routeName, arguments: '')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      text: 'تسجيل الدخول',
                      fun: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          print(value.user?.email);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Done ,Try To Sign In'),
                          ));
                          Navigator.of(context)
                              .pushNamed(LogInScreen.routeName);
                        }).catchError((e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text('invalid password or email try again :) '),
                            backgroundColor: Colors.red,
                          ));
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
