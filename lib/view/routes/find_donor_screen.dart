import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/blood_button.dart';
import '../widgets/lable_setting.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';
import 'transfusional_screen.dart';
import 'search_volunteer_screen.dart';

class FindDonorScreen extends StatefulWidget {
  static const routeName = 'finddonorscreen';
  const FindDonorScreen({super.key});

  @override
  State<FindDonorScreen> createState() => _FindDonorScreenState();
}

class _FindDonorScreenState extends State<FindDonorScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, bool>> bloodType = [
      {'A+': false},
      {'B+': false},
      {'O+': false},
      {'AB+': true},
      {'A-': false},
      {'B-': true},
      {'O-': false},
      {'AB-': false},
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppbarWidget(text: 'حدد المعلومات التالية'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'فصيله الدم',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Wrap(
                    children: bloodType
                        .map(
                          (value) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.height * 0.10,
                            child: BloodButton(
                              text: value.keys.single.toString(),
                              onPressed: () {
                                setState(() {
                                  value[value.keys.single.toString()] =
                                      !value.values.single;
                                  // print(value[value.keys.single.toString()]);
                                  print(bloodType[0]
                                      [value.keys.single.toString()]);
                                  value[value.keys.single.toString()] =
                                      !value.values.single;
                                });
                              },
                              isSelected: value.values.single,
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
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
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.03,
                  // ),
                  TextButton(
                      child: const Text('هل تريد معرفة توافق نقل الدم ؟'),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(TransfusionalScreen.routeName)),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.03,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ButtonWidget(
                        text: 'بحث',
                        fun: () => Navigator.of(context)
                            .pushNamed(SearchVolunteerScreen.routeName)),
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
