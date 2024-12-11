import 'dart:developer';

import 'package:Casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/consts.dart';
import '../../../data/models/barber_model.dart';

class BarberDetailsPage1 extends StatefulWidget {
  final Map<String, dynamic> barberJson;
  const BarberDetailsPage1({Key? key, required this.barberJson})
      : super(key: key);

  @override
  State<BarberDetailsPage1> createState() => _BarberDetailsPage1State();
}

class _BarberDetailsPage1State extends State<BarberDetailsPage1> {
  List features = [
    [
      "Website",
      Icons.directions_rounded,
      (String link, String useless) async {
        final Uri url = Uri.https(link
            .toString()
            .replaceAll("https://", "")
            .replaceFirst("wwww", "www"));
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          log('Could not launch $url');
        }
      }
    ],
    [
      "Message",
      Icons.message_rounded,
      (String phoneNumber, String message) async {
        final Uri smsUri = Uri(
          scheme: 'sms',
          path: phoneNumber,
          queryParameters: {'body': message},
        );

        if (await canLaunchUrl(smsUri)) {
          await launchUrl(smsUri);
        } else {
          throw 'Could not launch $smsUri';
        }
      }
    ],
    [
      "Call",
      Icons.call,
      (String phoneNumber) async {
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        if (await canLaunchUrl(launchUri)) {
          await launchUrl(launchUri);
        } else {
          throw 'Could not launch $launchUri';
        }
      }
    ],
    ["Direction", Icons.location_on, () {}],
    [
      "Share",
      Icons.share_rounded,
      (String link) {
        Share.share(link.replaceFirst("wwww", "www"));
      }
    ],
  ];

  List content = ["About us", "Services", "Gallery", "Review"];
  String currentContent = "About us";

  @override
  Widget build(BuildContext context) {
    Barber barber = Barber.fromMap(widget.barberJson);
    String barberName = barber.name;
    barberName = barberName
        .replaceAll(" Barbers", "")
        .replaceAll(" Barber Shop", "")
        .replaceAll(" Hair Studio", "");
    Map<String, Widget> contentWidget = {
      "About us": Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            barber.about,
            style: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: 12,
          ),
          Text("Working Hours",
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  fontStyle: FontStyle.normal)),
          SizedBox(
            height: 5,
          ),
          Text(
            "Monday - Friday           :   ${barber.monToFri[0]} - ${barber.monToFri[1]}\n"
            "Saturday - Sunday       :   ${barber.satSun[0]} - ${barber.satSun[1]}",
            style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: 12,
          ),
          Text("Contact us",
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  fontStyle: FontStyle.normal)),
          SizedBox(
            height: 5,
          ),
          Text(
            "${barber.phoneNo}",
            style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontStyle: FontStyle.normal),
          ),
          SizedBox(
            height: 12,
          ),
          Text("Our Address",
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  fontStyle: FontStyle.normal)),
          SizedBox(
            height: 5,
          ),
          Text(
            barber.address.toString(),
            style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontStyle: FontStyle.normal),
          ),
        ],
      ),
      "Services": Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Our Services",
            style: GoogleFonts.urbanist(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
                fontStyle: FontStyle.normal),
          ),
          Divider(color: Colors.grey.shade800),
          ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 5),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightCardFillColor
                        : Constants.darkCardFillColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(barber.listOfServices[index].toString(),
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade200,
                              fontStyle: FontStyle.normal)),
                      Text(barber.serviceTypeNos[index].toString() + " Types",
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount: barber.listOfServices.length)
        ],
      ),
      "Gallery": Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No images available in the gallery.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.urbanist(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade200,
                  fontStyle: FontStyle.normal))
        ],
      ),
      "Review": Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No reviews available for this barber.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.urbanist(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade200,
                  fontStyle: FontStyle.normal))
        ],
      ),
    };
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: CustomAppBar(
            text: "",
            leadingFunc: () {
              Navigator.pop(context);
            },
            leadingIcon: Icons.arrow_back,
          )),
      body: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // scrollBehavior: ScrollBehavior(),
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Image.network(
                barber.imageLink,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.fitHeight,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      barberName,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.urbanist(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                          fontStyle: FontStyle.normal),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 4,
                        alignment: Alignment.center,
                        height: 35,
                        decoration: BoxDecoration(
                            color: isShopOpen({
                              'monToFri': barber.monToFri,
                              'satSun': barber.satSun
                            })
                                ? Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary
                                : Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                            isShopOpen({
                              'monToFri': barber.monToFri,
                              'satSun': barber.satSun
                            })
                                ? "Open"
                                : "Closed",
                            style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontStyle: FontStyle.normal)))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 23,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : Constants.darkSecondary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      barber.address,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: GoogleFonts.urbanist(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_half_rounded,
                      size: 23,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightSecondary
                          : Constants.darkSecondary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${barber.stars.toString()} (${barber.noOfReviews.toString()} reviews)",
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: GoogleFonts.urbanist(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < features.length; i++)
                        GestureDetector(
                          onTap: () {
                            switch (i) {
                              case 0:
                                final func =
                                    features[0][2] as Function(String, String);
                                func(barber.website, "Nothing");
                              case 1:
                                final func =
                                    features[1][2] as Function(String, String);
                                func(barber.phoneNo,
                                    "Dear User,\nWrite your message here.");
                              case 2:
                                final func = features[2][2] as Function(String);
                                func(barber.phoneNo);
                              case 3:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Directions not available.'),
                                  ),
                                );
                                ;
                              case 4:
                                final func = features[4][2] as Function(String);
                                func(barber.website);
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27.5),
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Constants.lightSecondary
                                          .withOpacity(0.2)
                                      : Constants.darkSecondary
                                          .withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Icon(
                                    features[i][1],
                                    size: 25,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Constants.lightSecondary
                                        : Constants.darkSecondary,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                features[i][0],
                                style: GoogleFonts.urbanist(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Constants.lightTextColor
                                        : Constants.darkTextColor,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        )
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Divider(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade200
                      : Colors.grey.shade300,
                  thickness: 2,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: content.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return OutlinedButton(
                          onPressed: () {
                            setState(() {
                              currentContent = content[index];
                            });
                          },
                          child: Text(
                            content[index],
                            style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: currentContent != content[index]
                                    ? (Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Constants.lightSecondary
                                        : Constants.darkSecondary)
                                    : Constants.lightPrimary,
                                fontStyle: FontStyle.normal),
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: currentContent != content[index]
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Constants.lightSecondary
                                          .withOpacity(0.1)
                                      : Constants.darkSecondary
                                          .withOpacity(0.1))
                                  : (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Constants.lightSecondary
                                      : Constants.darkSecondary),
                              foregroundColor: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              side: BorderSide(
                                width: 2,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary,
                              )));
                    }),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: contentWidget[currentContent]))
          ]),
    );
  }
}

bool isShopOpen(Map<String, List<dynamic>> schedule) {
  // Get the current date and time
  DateTime now = DateTime.now();
  String currentDay = DateFormat('EEEE').format(now).toLowerCase();

  // Determine the key for the schedule map based on the day
  String scheduleKey = (currentDay == 'saturday' || currentDay == 'sunday')
      ? 'satSun'
      : 'monToFri';

  // Get the opening and closing times from the schedule
  List<dynamic>? timings = schedule[scheduleKey];
  if (timings == null || timings.length != 2) {
    throw ArgumentError('Invalid schedule data');
  }

  // Parse the opening and closing times
  DateTime openingTime = DateTime(now.year, now.month, now.day,
      int.parse(timings[0].split(":")[0]), int.parse(timings[0].split(":")[1]));
  DateTime closingTime = DateTime(now.year, now.month, now.day,
      int.parse(timings[1].split(":")[0]), int.parse(timings[1].split(":")[1]));

  // Check if the current time is within the opening hours
  return now.isAfter(openingTime) && now.isBefore(closingTime);
}
