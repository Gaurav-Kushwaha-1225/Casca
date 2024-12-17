
import '../../data/models/barber_model.dart' as BarberDataModel;

class Barber {
  final name;
  final address;
  final stars;
  final List<dynamic> listOfServices;
  final noOfReviews;
  final imageLink;
  final phoneNo;
  final website;
  final about;
  final List<dynamic> monToFri;
  final List<dynamic> satSun;
  final List<dynamic> serviceTypeNos;

  Barber({
    required this.name,
    required this.address,
    required this.stars,
    required this.listOfServices,
    required this.noOfReviews,
    required this.imageLink,
    required this.phoneNo,
    required this.website,
    required this.about,
    required this.monToFri,
    required this.satSun,
    required this.serviceTypeNos,
  });

  factory Barber.fromModelBarber(BarberDataModel.Barber barber) {
    return Barber(
      name: barber.name,
      address: barber.address,
      stars: barber.stars,
      listOfServices: barber.listOfServices,
      noOfReviews: barber.noOfReviews,
      imageLink: barber.imageLink,
      phoneNo: barber.phoneNo,
      website: barber.website,
      about: barber.about,
      monToFri: barber.monToFri,
      satSun: barber.satSun,
      serviceTypeNos: barber.serviceTypeNos,
    );
  }
}
