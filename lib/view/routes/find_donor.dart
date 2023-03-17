import 'package:flutter/material.dart';

import '../widgets/lable_setting.dart';
import '../widgets/normal_button.dart';

class FindDonor extends StatelessWidget {
  static const routeName = 'finddonor';
  const FindDonor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 80, 90),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              height: MediaQuery.of(context).size.height * 1 / 6,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const Text(
                      'حدد المعلومات التالية',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'فصيله الدم',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text('O+')),
                      TextButton(onPressed: () {}, child: Text('A+')),
                      TextButton(onPressed: () {}, child: Text('B+')),
                      TextButton(onPressed: () {}, child: Text('AB+')),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text('O-')),
                      TextButton(onPressed: () {}, child: Text('A-')),
                      TextButton(onPressed: () {}, child: Text('B-')),
                      TextButton(onPressed: () {}, child: Text('AB-')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'المدينة',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            child: lableSetting(
                                lable: 'المدينة',
                                initText: 'المنصوره',
                                validator: (val) {}),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'المحافظة',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              width: 100,
                              child: lableSetting(
                                  lable: 'المحافظه',
                                  initText: 'الدقهلية',
                                  validator: (val) {})),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  TextButton(
                    child: const Text('هل تريد معرفة توافق نقل الدم ؟'),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: NormalButton(
                      text: 'بحث',
                      fun: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
