import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bloodbank/view/routes/main_screen.dart';
import '../widgets/button_widget.dart';
import '../widgets/label_setting.dart';
import 'singup_screen.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = '/loginscreen';

  LogInScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                        lable: 'عنوان البريد الالكترونى ',
                        controller: emailController,
                        validator: (val) {}),
                    lableSetting(
                        lable: 'كلمة المرور',
                        controller: passwordController,
                        validator: (val) {},
                        obsecure: true),
                    TextButton(
                        child: const Text('لا امتلك حساب . تسجيل حساب جديد'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(SingUpScreen.routeName)),
                    TextButton(
                        child: const Text('تخطي التسجيل'),
                        onPressed: () => Navigator.of(context).pushNamed(
                            MainScreen.routeName,
                            arguments: 'بدون تسجيل')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      text: 'تسجيل الدخول',
                      fun: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          Navigator.of(context).pushNamed(MainScreen.routeName,
                              arguments: FirebaseAuth
                                  .instance.currentUser!.email
                                  .toString());
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
      ),
    );
  }
}
