import 'package:bloodbank/view/routes/chat_screen.dart';
import 'package:bloodbank/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SearchVolunteerScreen extends StatelessWidget {
  const SearchVolunteerScreen({Key? key}) : super(key: key);
  static const routeName = '/searchvolunteerscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 231, 80, 90),
        centerTitle: true,
        title: const TextWidget(
          text: 'ألبحث عن متبرع',
          size: 24,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Icon(
              Icons.filter_alt_rounded,
              size: 25,
            ),
          )
        ],
        elevation: 0,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
            itemBuilder: (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(20),
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
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          TextWidget(
                              text: 'المنصورة /  طلخا ',
                              size: 16,
                              color: Colors.grey),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              width: 50,
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
                                  child: Icon(
                                Icons.call,
                                color: Color.fromARGB(255, 231, 80, 90),
                              )),
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed(ChatScreen.routeName),
                            child: Container(
                              height: 35,
                              width: 50,
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
                                  child: Icon(
                                Icons.message_outlined,
                                color: Color.fromARGB(255, 231, 80, 90),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (_, index) => const SizedBox(),
            itemCount: 5),
      ),
    );
  }
}
