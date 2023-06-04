import 'package:flutter/material.dart';

import '../../model/onboard_page_model.dart';
import '../widgets/onboard_container.dart';

class OnboardScreen extends StatelessWidget {
  static const routeName = '/onboardScreen';
  OnboardScreen({Key? key}) : super(key: key);

  List<Onboardmodel> onBoradList = [
    Onboardmodel(
        'ابحث عن متبرعين متاحين بالقرب منك .', 'asset/images/onb1.png', true),
    Onboardmodel('لكي تكون متبرعا مسؤولا ،يجب أن تحصل على فحص طبي.',
        'asset/images/onb2.png', true),
    Onboardmodel(
        'قطره من دمك تنقذ \n حياه انسان ', 'asset/images/onb3.png', false)
  ];
  static final contrpage = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: PageView.builder(
          itemBuilder: (context, index) => onBoardContainer(
              onBoradList[index].subtitle,
              onBoradList[index].image,
              onBoradList[index].sec,
              index),
          itemCount: onBoradList.length,
          controller: contrpage,
        )),
      ],
    );
  }
}
