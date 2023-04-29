import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matcher/matcher.dart';

import '../widgets/appbar_homepage_widget.dart';
import '../widgets/blood_widget.dart';
import '../widgets/lable_setting.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  bool readOnly = true;
  String readOnlyText = 'تعديل';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: 4,
            child: AppbarHomePageWidget(
                isButton: true,
                picture: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 231, 80, 90),
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'asset/images/person.png',

                              // height: MediaQuery.of(context).size.height * 0.03, //image size
                            ),
                          ),
                        ),
                        const BloodWidget(
                            bloodTybe:
                                'A+') // this widget to show the blood type
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Text(
                      'نيفين ياسر محمد',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ))), //AppBar Widget
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            widget.readOnly = !widget.readOnly;
                          });
                        },
                        child: Text(widget.readOnly ? 'تعديل' : 'تم')),
                  ],
                ),
                lableSetting(
                    lable: 'الاسم بالكامل',
                    initText: 'نيفين ياسر محمد',
                    readOnly: widget.readOnly,
                    validator: (val) {}),
                lableSetting(
                    lable: 'رقم الهاتف',
                    initText: '01026298640',
                    readOnly: widget.readOnly,
                    validator: (val) {}),
                lableSetting(
                    lable: 'البريد الالكتروني',
                    initText: 'm@yahoo.com',
                    readOnly: widget.readOnly,
                    validator: (val) {}),
                lableSetting(
                    lable: 'المحافظه',
                    initText: 'الدقهلية',
                    readOnly: widget.readOnly,
                    validator: (val) {},
                    obsecure: false),
                lableSetting(
                    lable: 'المدينة/المنطقة',
                    initText: 'طلخا',
                    readOnly: widget.readOnly,
                    validator: (val) {}),
                lableSetting(
                  lable: 'فصيله الدم ',
                  initText: 'A+',
                  readOnly: widget.readOnly,
                  validator: (val) {},
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
