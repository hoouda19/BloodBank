import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withOpacity(.2),
        // border: Border.all(),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(200),
          bottomRight: Radius.circular(200),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.red,
              ),
              Text('المنصورة'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            child: ListTile(
              trailing: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red),
                ),
                child: CircleAvatar(
                  radius: 30,
                  child: const Icon(
                    Icons.person,
                  ),
                ),
              ),
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'o+',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'محمود محمد عبدالمجيد',
                      ),
                    ],
                  ),
                ],
              ),
              // subtitle:
            ),
          ),
        ],
      ),
    );
  }
}
