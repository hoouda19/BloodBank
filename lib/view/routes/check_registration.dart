import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/lable_setting.dart';
import '../widgets/text_widget.dart';
import 'singup_screen.dart';

class CheckRegistration extends StatelessWidget {
  static const routeName = '/checkregistration';
  const CheckRegistration({super.key});

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
                          bottom: MediaQuery.of(context).size.height * 0.015,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'رمز التأكيد',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        )),
                    Container(
                        alignment: Alignment.center,
                        child: const TextWidget(
                          text: 'ادخل رمز التأكيد المرسل الى    01026298640+2',
                          size: 15,
                        )),
                    lableSetting(
                        lable: 'عنوان البريد الالكترونى ',
                        initText: '',
                        validator: (val) {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            child: const Text('اعاده الارسال'),
                            onPressed: () => Navigator.of(context)
                                .pushNamed(SingUpScreen.routeName)),
                        const TextWidget(
                          text: 'لم تستلم رمز التأكيد؟',
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: ButtonWidget(
                        text: 'تأكيد',
                        // bakcgroundcolor: const Color.fromARGB(255, 231, 80, 90)
                        //     .withOpacity(0.4),
                        // side: const Color.fromARGB(255, 231, 80, 90)
                        //     .withOpacity(0.4),
                        clickable: false,
                        fun: () {},
                      ),
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
