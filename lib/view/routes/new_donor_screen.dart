import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bloodbank/view/widgets/text_widget.dart';
import '../widgets/alert_dialog_widget.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';
import 'login_screen.dart';

class NewDonorScreen extends StatefulWidget {
  static const routeName = '/newdonorscreen';
  const NewDonorScreen({super.key});

  @override
  State<NewDonorScreen> createState() => _NewDonorScreenState();
}

class _NewDonorScreenState extends State<NewDonorScreen> {
  @override
  Widget build(BuildContext context) {
    final userEmail = ModalRoute.of(context)!.settings.arguments as String;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(userEmail).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const AppbarWidget(text: 'متبرع جديد');
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Center(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppbarWidget(text: 'متبرع جديد'),
                    Column(
                      children: [
                        const TextWidget(
                          text: "لم تسجيل بعد ",
                          size: 20,
                        ),
                        TextButton(
                            child: const Text('تسجيل الدخول'),
                            onPressed: () => Navigator.of(context)
                                .pushNamed(LogInScreen.routeName)),
                      ],
                    ),
                    const SizedBox()
                  ],
                ),
              ));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppbarWidget(text: 'متبرع جديد'),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        TextFieldWidget(
                            lable: 'الاسم', initText: data['name'].toString()),
                        TextFieldWidget(
                            lable: 'البريد الالكتروني',
                            initText: data['email'].toString()),
                        TextFieldWidget(
                            lable: 'رقم الهاتف',
                            initText: data['number'].toString()),
                        TextFieldWidget(
                            lable: 'المدينة/المنطقة',
                            initText: data['city'].toString()),
                        TextFieldWidget(
                            lable: 'فصيله الدم',
                            initText: data['bloodtype'].toString()),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: TextWidget(
                        text: 'قطره من دمك تنقذ حياه انسان...!', size: 15),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ButtonWidget(
                        text: 'سجل كا متبرع',
                        fun: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(data['email'].toString())
                              .update({
                            'donor': 'true',
                            'name': data['name'].toString(),
                            'email': data['email'].toString(),
                            'number': data['number'].toString(),
                            'city': data['city'].toString(),
                            'bloodtype': data['bloodtype'].toString(),
                          });
                          Timer(const Duration(seconds: 1), () {
                            Navigator.of(context).pop();
                          });
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialogWidget(
                                title: 'try', subTitle: 'hello'),
                          );
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  )
                ],
              );
            }

            return const AppbarWidget(text: 'متبرع جديد');
          },
        )),
      ),
    );
  }
}
