import 'package:bloodbank/view/routes/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:bloodbank/view/routes/home_screen.dart';
import '../routes/login_screen.dart';
import '../routes/onboard_page_screen.dart';
import '../routes/singup_screen.dart';
import 'button_widget.dart';

class onBoardContainer extends StatefulWidget {
  final String subTitle;
  final String image;
  final int currentpage;

  final bool sec;
  const onBoardContainer(this.subTitle, this.image, this.sec, this.currentpage,
      {Key? key})
      : super(key: key);

  @override
  State<onBoardContainer> createState() => _onBoardContainerState();
}

class _onBoardContainerState extends State<onBoardContainer> {
  @override
  void dispose() {
    // contrpage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          MainScreen.routeName,
                          arguments: 'بدون تسجيل');
                    },
                    child: const Text(
                      'تخطي التسجيل',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            Container(
              width: 300,
              height: mediaSize.height * 1 / 3,
              child: Image.asset(
                widget.image,
                //fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                // color: Colors.greenAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              height: mediaSize.height * 1 / 3,
              width: double.infinity,
              //   color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: mediaSize.height * 1 / 5,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Text(
                                widget.subTitle,
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DotsIndicator(
                                dotsCount: 3,
                                position: widget.currentpage.toDouble(),
                                decorator: DotsDecorator(
                                  size: const Size.square(9.0),
                                  activeSize: const Size(35.0, 9.0),
                                  color: Colors.red.withOpacity(0.3),
                                  activeColor:
                                      const Color.fromARGB(255, 231, 80, 90),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: widget.sec
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  child: const Text(
                                    'رجوع',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () => OnboardScreen.contrpage
                                      .previousPage(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeIn),
                                ),
                                MaterialButton(
                                  onPressed: () => OnboardScreen.contrpage
                                      .nextPage(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeIn),
                                  color: Color.fromARGB(255, 231, 80, 90),
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(10),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ButtonWidget(
                                    text: 'لدي حساب',
                                    fun: () {
                                      Navigator.of(context)
                                          .pushNamed(LogInScreen.routeName);
                                    },
                                    textcolor:
                                        const Color.fromARGB(255, 231, 80, 90),
                                    bakcgroundcolor: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: mediaSize.height * 1 / 25,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: ButtonWidget(
                                    text: 'حساب جديد',
                                    fun: () {
                                      Navigator.of(context)
                                          .pushNamed(SingUpScreen.routeName);
                                    },
                                  ),
                                ),
                              ],
                            ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
