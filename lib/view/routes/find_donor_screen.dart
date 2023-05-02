import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/blood_button.dart';
import '../widgets/lable_setting.dart';
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
    {'AB+': true},
    {'A-': false},
    {'B-': true},
    {'O-': false},
    {'AB-': false},
  ];

  List<SelectedListItem> cities = [
    SelectedListItem(name: 'المنصورة'),
    SelectedListItem(name: 'القاهرة'),
    SelectedListItem(name: 'الاسكندرية'),
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
                          //                       DropDownState(
                          //   DropDown(
                          //     bottomSheetTitle: const Text(
                          //       'المدينة',
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 20.0,
                          //       ),
                          //     ),
                          //     submitButtonChild: const Text(
                          //       'Done',
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     data: widget.cities ?? [],
                          //     selectedItems: (List<dynamic> selectedList) {
                          //       List<String> list = [];
                          //       for(var item in selectedList) {
                          //         if(item is SelectedListItem) {
                          //           list.add(item.name);
                          //         }
                          //       }
                          //       // showSnackBar(list.toString());
                          //     },
                          //     enableMultipleSelection: true,
                          //   ),
                          // ).showModal(context);

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
                                  controller: null,
                                  lable: 'المحافظه',
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
                      SizedBox(
                          width: 100,
                          child: lableSetting(
                              controller: null,
                              lable: 'المحافظه',
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
