import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppbarWidget extends StatelessWidget {
  final Widget picture;
  final bool isButton;
  final double round;
  const AppbarWidget(
      {super.key,
      required this.picture,
      required this.isButton,
      this.round = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(.2),
          // border: Border.all(),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(round),
            bottomRight: Radius.circular(round),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        icon: const FaIcon(
                          FontAwesomeIcons.bars,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                : Container(),
            picture
          ],
        ));
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.location_on_outlined,
//                 color: Colors.red,
//               ),
//               Text('المنصورة'),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             width: 300,
//             child: ListTile(
//               trailing: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.red),
//                 ),
//                 child: CircleAvatar(
//                   radius: 30,
//                   child: const Icon(
//                     Icons.person,
//                   ),
//                 ),
//               ),
//               title: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'o+',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red,
//                             fontSize: 20),
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         'محمود محمد عبدالمجيد',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               // subtitle:
//             ),
//           ),
//         ],
//       ),
