import 'package:flutter/material.dart';

import '../../model/onboard_page_model.dart';
import '../widgets/onBoardcontainer.dart';

class onboardPageView extends StatelessWidget {
  onboardPageView({Key? key}) : super(key: key);

  List<Onboardmodel> onBoradList = [
    Onboardmodel('Resturant App', 'Welcom To Resturant App',
        'asset/images/onb1.png', '', true),
    // Onboardmodel('Coffee App', 'In This App You Can Buy Any Coffee',
    //     'assets/onboardimage/pngwing1.png'),
    Onboardmodel('Resturant App', 'The Best Price', 'asset/images/onb1.png',
        'START', false)
  ];
  static final contrpage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemBuilder: (context, index) => onBoardContainer(
        onBoradList[index].title,
        onBoradList[index].subtitle,
        onBoradList[index].image,
        onBoradList[index].floatimg,
        onBoradList[index].sec,
      ),
      itemCount: onBoradList.length,
      controller: contrpage,
    ));
  }
}
