import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bloodbank/view/widgets/text_widget.dart';
import '../../Controller/nearby_hospitals_controller.dart';
import '../widgets/appbar_widget.dart';

class NearbyHospitalsScreen extends StatelessWidget {
  static const routeName = '/bloodbankscreen';

  const NearbyHospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hospital = NearbyHospitalsController();

    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const AppbarWidget(
              text: 'المستشفيات المجاورة',
              isback: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: hospital.get().length,
                itemBuilder: (context, index) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            hospital.get()[index].image,
                            fit: BoxFit.cover,
                          )),
                      TextWidget(
                        text: hospital.get()[index].title,
                        size: 20,
                        textalign: TextAlign.center,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await launchUrl(
                                Uri.parse(hospital.get()[index].url),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.location_pin),
                              Text('الموقع')
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
