import 'package:bloodbank/view/routes/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/lable_setting.dart';
import 'singup_screen.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = '/loginscreen';

  const LogInScreen({super.key});

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
                        initText: 'violamm12gmail.com',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'كلمة المرور',
                        initText: '0514651654',
                        validator: (val) {},
                        obsecure: true),
                    TextButton(
                        child: const Text('لا امتلك حساب . تسجيل حساب جديد'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(SingUpScreen.routeName)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      text: 'تسجيل الدخول',
                      fun: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
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
