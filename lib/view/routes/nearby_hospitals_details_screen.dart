import 'package:bloodbank/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';

class NearbyHospitalsDetailsScreen extends StatelessWidget {
  static const routeName = '/bloodbankdetailsscreen';
  const NearbyHospitalsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppbarWidget(
                text: 'المستشفيات المجاورة',
              ),
              TextWidget(text: 'المستشفي العام'),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                    'https://img.youm7.com/large/202008140411531153.jpg'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_pin),
                        Text('الموقع')
                      ],
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
