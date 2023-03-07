import 'package:bloodbank/view/routes/home_page.dart';
import 'package:flutter/material.dart';
import '../routes/onboard_page_view.dart';

class onBoardContainer extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  final String floatimg;
  final bool sec;
  const onBoardContainer(
      this.title, this.subTitle, this.image, this.floatimg, this.sec,
      {Key? key})
      : super(key: key);

  @override
  State<onBoardContainer> createState() => _onBoardContainerState();
}

class _onBoardContainerState extends State<onBoardContainer> {
  @override
  void dispose() {
    // contrpage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: mediaSize.height * 1 / 2,
              child: Image.asset(
                widget.image,
                //fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                // color: Colors.greenAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              height: mediaSize.height * 1 / 3,
              width: double.infinity,
              //   color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 45,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    //backgroundColor: Colors.greenAccent,
                    child: Text(
                      widget.floatimg,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: widget.sec
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text('رجوع'),
                                onPressed: () => onboardPageView.contrpage
                                    .nextPage(
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeIn),
                              ),
                              MaterialButton(
                                onPressed: () => onboardPageView.contrpage
                                    .nextPage(
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeIn),
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 24,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),
                            ],
                          )
                        : Text(''),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
