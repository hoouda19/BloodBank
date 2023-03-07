import 'package:flutter/material.dart';
import '../widgets/container_tap.dart';
import '../widgets/appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 4, child: AppbarWidget()), //AppBar Widget
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //ContainerMariem
                          homeContainerTap(
                            image: 'TAPER 2',
                            text: 'ابحث عن متبرع',
                            context: context,
                            onTap: () {},
                          ),
                          homeContainerTap(
                              image: 'TAPER 2',
                              text: 'اتبرع بالدم',
                              context: context,
                              onTap: () {}),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      homeContainerTap(
                          image: 'TAPER 3',
                          text: 'مشاركة التطبيق',
                          context: context,
                          onTap: () {
                            print('object');
                          }),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade200,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2.5,
                                    blurRadius: 20),
                              ]),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Center(
                              child: Text(
                            'نصائح وارشادات',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent.shade200,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.5,
                                blurRadius: 20),
                          ]),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Center(
                          child: Text(
                        'نصائح وارشادات',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
