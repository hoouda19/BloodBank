import 'package:flutter/material.dart';
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
                const Expanded(flex: 3, child: AppbarWidget()), //AppBar Widget
                Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              color: Colors.redAccent,
                              height: 100,
                              width: 100,
                            ),
                            Container(
                              color: Colors.redAccent,
                              height: 100,
                              width: 100,
                            )
                          ],
                        ),
                        Container(
                          color: Colors.redAccent,
                          height: 100,
                          width: 100,
                        ),
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.redAccent,
                          height: 100,
                          width: 100,
                        ),
                        Container(
                          color: Colors.redAccent,
                          height: 100,
                          width: 100,
                        )
                      ],
                    ))
              ]),
        ),
      ),
    );
  }
}
