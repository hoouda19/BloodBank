import 'package:bloodbank/view/routes/check_registration_screen.dart';
import 'package:flutter/material.dart';

import 'package:bloodbank/view/widgets/lable_setting.dart';
import '../widgets/button_widget.dart';
import 'login_screen.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);
  static const routeName = '/singupscreen';

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
                        initText: 'نيفين ياسر محمد',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'عنوان البريد الالكترونى ',
                        initText: 'viola****@gmail.com',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'كلمة المرور',
                        initText: '0514651654',
                        validator: (val) {},
                        obsecure: true),
                    lableSetting(
                        lable: 'رقم الموبايل ',
                        initText: '01234567890',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'فصيله الدم ',
                        initText: 'A+',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'المدينه',
                        initText: 'طلخا',
                        validator: (val) {}),
                    TextButton(
                        child: const Text('لدي حساب'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(LogInScreen.routeName)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      text: 'تسجيل الدخول',
                      fun: () {
                        Navigator.of(context)
                            .pushNamed(CheckRegistrationScreen.routeName);
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
