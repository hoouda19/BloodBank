import '../model/nearby_hospitals_model.dart';

class NearbyHospitalsController {
  final List<NearbyHospitalsModel> _listItems = [
    NearbyHospitalsModel(
        title: 'مستشفى العام',
        image:
            'https://media.gemini.media/img/Original/2023/1/4/2023_1_4_13_52_48_296.jpg',
        url: 'https://goo.gl/maps/D3QdVssFvjCMjncVA',
        latitude: '31.044727079930386',
        longitude: '31.044727079930386'),
    NearbyHospitalsModel(
        title: 'مستشفي الصدر',
        image: 'https://img.youm7.com/large/s12201028175455.jpg',
        url: 'https://goo.gl/maps/HmmFDBuC5DcPYdrTA',
        latitude: '31.032747136741232',
        longitude: '31.372975389294293'),
    NearbyHospitalsModel(
        title: 'مستشفى طوارئ',
        image:
            'https://watanimg.elwatannews.com/image_archive/840x473/17398604741517958273.jpg',
        url: 'https://goo.gl/maps/xRMf2NnhTMB5KyVS7',
        latitude: '31.043659973569028',
        longitude: '31.364813459494624'),
    NearbyHospitalsModel(
        title: 'مستشفي الاطفال',
        image: 'https://img.youm7.com/large/202008140411531153.jpg',
        url: 'https://goo.gl/maps/GKy6E7Y49jE6v2ZdA',
        latitude: '31.045634826716274',
        longitude: '31.35957147020605'),
  ];

  List<NearbyHospitalsModel> get() {
    return [..._listItems];
  }
}
