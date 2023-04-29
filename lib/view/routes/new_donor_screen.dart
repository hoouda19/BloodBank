import 'package:bloodbank/view/routes/check_registration_screen.dart';
import 'package:bloodbank/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/alert_dialog_widget.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/lable_setting.dart';

class NewDonorScreen extends StatelessWidget {
  static const routeName = '/newdonorscreen';
  const NewDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppbarWidget(text: 'متبرع جديد'),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    lableSetting(
                        lable: 'الاسم بالكامل',
                        initText: 'نيفين ياسر محمد',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'رقم الهاتف',
                        initText: '01026298640',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'المحافظه',
                        initText: 'الدقهلية',
                        validator: (val) {},
                        obsecure: false),
                    lableSetting(
                        lable: 'المدينة/المنطقة',
                        initText: 'طلخا',
                        validator: (val) {}),
                    lableSetting(
                        lable: 'فصيله الدم ',
                        initText: 'A+',
                        validator: (val) {}),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(CheckRegistrationScreen.routeName),
                  child: const TextWidget(
                      text: 'قطره من دمك تنقذ حياه انسان...!', size: 15)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ButtonWidget(
                    text: 'بحث',
                    fun: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialogWidget(title: 'try', subTitle: 'hello'),
                      );
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}
