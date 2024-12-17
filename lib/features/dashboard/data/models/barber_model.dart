
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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'stars': stars,
      'types_of_services': listOfServices,
      'no_reviews': noOfReviews,
      'image_link': imageLink,
      'mob_no': phoneNo,
      'website': website,
      'about': about,
      'time_mon_fri': monToFri,
      'time_sat_sun': satSun,
      'service_types': serviceTypeNos
    };
  }

  factory Barber.fromMap(Map<String, dynamic> map) {
    return Barber(
      name: map['name'],
      address: map['address'],
      stars: map['stars'],
      listOfServices: map['types_of_services'],
      noOfReviews: map['no_reviews'],
      imageLink: map['image_link'],
      phoneNo: map['mob_no'],
      website: map['website'],
      about: map['about'],
      monToFri: map['time_mon_fri'],
      satSun: map['time_sat_sun'],
      serviceTypeNos: map['service_types'],
    );
  }

/*  factory Barber.fromSqfliteDatabase(Map<String, dynamic> map) {
    return Barber(
      name: map['name'],
      address: map['address'],
      stars: map['address'],
      listOfServices: map['listOfServices'],
      noOfReviews: map['noOfReviews'],
      imageLink: map['imageLink'],
      phoneNo: map['phoneNo'],
      website: map['website'],
      about: map['about'],
      monToFri: map['monToFri'],
      satSun: map['satSun'],
      serviceTypeNos: map['serviceTypeNos'],
    );
  }*/
}
