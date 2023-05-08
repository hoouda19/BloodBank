// import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
// import 'package:drop_down_list/drop_down_list.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/blood_button.dart';
import '../widgets/label_setting.dart';
import '../widgets/button_widget.dart';
import 'transfusional_screen.dart';
import 'search_volunteer_screen.dart';

class FindDonorScreen extends StatefulWidget {
  static const routeName = 'finddonorscreen';
  FindDonorScreen({super.key});

  @override
  State<FindDonorScreen> createState() => _FindDonorScreenState();

  List<Map<String, bool>> bloodType = [
    {'A+': false},
    {'B+': false},
    {'O+': false},
    {'AB+': false},
    {'A-': false},
    {'B-': false},
    {'O-': false},
    {'AB-': false},
  ];
}

class _FindDonorScreenState extends State<FindDonorScreen> {
  @override
  Widget build(BuildContext context) {
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
                    children: widget.bloodType
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
                          SizedBox(
                            width: 100,
                            child: lableSetting(
                                controller: null,
                                lable: 'المدينة',
                                validator: (val) {}),
                          )
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                      child: const Text('هل تريد معرفة توافق نقل الدم ؟'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          TransfusionalScreen.routeName,
                        );
                      }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ButtonWidget(
                        text: 'بحث',
                        fun: () {
                          for (var element in widget.bloodType) {
                            if (element.values.single == true) {
                              Navigator.of(context).pushNamed(
                                  SearchVolunteerScreen.routeName,
                                  arguments: element.keys.single);
                            }
                          }
                        }),
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
  // List list = [];
  //                         for (var element in widget.bloodType) {
  //                           if (element.values.single == true) {
  //                             list.add(element.keys);
  //                           } else {
  //                             ScaffoldMessenger.of(context)
  //                                 .showSnackBar(const SnackBar(
  //                               content: Text(
  //                                 'اختر الفصيلة اولا ',
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                             ));
  //                             break;
  //                           }
  //                         }
  //                         Navigator.of(context).pushNamed(
  //                             SearchVolunteerScreen.routeName,
  //                             arguments: list);