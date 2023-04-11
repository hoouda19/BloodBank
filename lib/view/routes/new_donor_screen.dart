import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/lable_setting.dart';

class NewDonorScreen extends StatelessWidget {
  static const routeName = '/newdonorscreen';
  const NewDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarWidget(text: 'متبرع جديد'),
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
              lable: 'المدينة/المنطقة', initText: 'طلخا', validator: (val) {}),
          lableSetting(
              lable: 'فصيله الدم ', initText: 'A+', validator: (val) {}),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ButtonWidget(text: 'بحث', fun: () {}),
          ),
        ],
      ),
    );
  }
}
