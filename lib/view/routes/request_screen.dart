import 'package:flutter/material.dart';

import 'package:bloodbank/view/routes/chat_screen.dart';
import 'package:bloodbank/view/routes/search_volunteer_screen.dart';
import 'package:bloodbank/view/widgets/text_widget.dart';

import '../widgets/appbar_widget.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);
  static const routeName = '/messengerscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarWidget(text: 'الطلبات'),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(20),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1,
                                blurRadius: 1),
                          ]),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Image.asset(
                              'asset/images/person.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                  text: 'نيفين ياسر  A+',
                                  size: 18,
                                  weight: FontWeight.bold),
                              SizedBox(
                                height: 13,
                              ),
                              TextWidget(
                                  text: 'المنصورة /  طلخا ',
                                  size: 16,
                                  color: Colors.grey),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChatScreen()));
                                },
                                child: Container(
                                  height: 35,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color.fromARGB(
                                          255, 231, 80, 90),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurStyle: BlurStyle.outer,
                                            spreadRadius: 1,
                                            blurRadius: 5),
                                      ]),
                                  child: const Center(
                                    child: TextWidget(
                                      text: 'قبول',
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchVolunteerScreen()));
                                },
                                child: Container(
                                  height: 35,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurStyle: BlurStyle.outer,
                                            spreadRadius: 1,
                                            blurRadius: 5),
                                      ]),
                                  child: const Center(
                                    child: TextWidget(
                                      text: 'رفض',
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (_, index) => SizedBox(),
                itemCount: 1),
          ),
        ],
      ),
    );
  }
}
