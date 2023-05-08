import 'package:bloodbank/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bloodbank/view/widgets/label_setting.dart';
import '../widgets/button_widget.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SingUpScreen extends StatefulWidget {
  SingUpScreen({Key? key}) : super(key: key);
  static const routeName = '/singupscreen';

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final numberController = TextEditingController();

  final cityController = TextEditingController();

  final bloodTypeController = TextEditingController();

  String dropdownvalue = 'A+';

  // List of items in our dropdown menu
  var items = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

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
                          'انشاء حساب',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        )),
                    lableSetting(
                        lable: 'الاسم الكامل',
                        controller: nameController,
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
                        controller: numberController,
                        validator: (val) {}),
                    lableSetting(
                        lable: 'المدينه',
                        controller: cityController,
                        validator: (val) {}),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 1 / 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            value: dropdownvalue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                          const TextWidget(
                            text: 'فصيلة الدم ',
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        child: const Text('لدي حساب'),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(LogInScreen.routeName)),
                    // TextButton(
                    //     child: const Text('محمود'),
                    //     onPressed: () => Navigator.of(context).pushNamed(
                    //         MainScreen.routeName,
                    //         arguments: 'مستخدم')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      text: 'انشاء حساب',
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
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(emailController.text)
                              .set({
                            'name': nameController.text,
                            'email': emailController.text,
                            'number': numberController.text,
                            'city': cityController.text,
                            'bloodtype': dropdownvalue,
                          });
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
