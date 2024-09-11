import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({Key? key}) : super(key: key);

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  List productsAvailable = [
    {"product": "Haircuts", "icon": CupertinoIcons.scissors},
    {"product": "Make Up", "icon": Icons.brush_rounded},
    {"product": "Manicure", "icon": CupertinoIcons.paintbrush},
    {"product": "Massage", "icon": CupertinoIcons.color_filter},
  ];

  List nearbyLocationProducts = [
    "All",
    "Haircuts",
    "Make Up",
    "Manicure",
    "Massage"
  ];
  String nearbyLocationProductSelected = "All";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        scrollBehavior: ScrollBehavior(),
        physics: const BouncingScrollPhysics(),
        slivers: [
          /*SliverToBoxAdapter(
              child: Text(
                "Morning, Gaurav👋",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.urbanist(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  letterSpacing: 2,
                  wordSpacing: 1.25,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20,)),*/
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < productsAvailable.length; i++)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.5),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightSecondary.withOpacity(0.2)
                                    : Constants.darkSecondary.withOpacity(0.2),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                productsAvailable[i]["icon"],
                                size: 25,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary,
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          productsAvailable[i]["product"],
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade200
                  : Colors.grey.shade300,
              thickness: 2,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Nearby Your Location",
                  style: GoogleFonts.urbanist(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Constants.lightTextColor
                          : Constants.darkTextColor,
                      fontStyle: FontStyle.normal),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nearbyLocationProductSelected = "All";
                    });
                  },
                  child: Text(
                    "See All",
                    style: GoogleFonts.urbanist(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Constants.lightSecondary
                            : Constants.darkSecondary,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: nearbyLocationProducts.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return OutlinedButton(
                        onPressed: () {
                          setState(() {
                            nearbyLocationProductSelected =
                                nearbyLocationProducts[index];
                          });
                        },
                        child: Text(
                          nearbyLocationProducts[index],
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: nearbyLocationProductSelected !=
                                      nearbyLocationProducts[index]
                                  ? (Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Constants.lightSecondary
                                      : Constants.darkSecondary)
                                  : Constants.lightPrimary,
                              fontStyle: FontStyle.normal),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: nearbyLocationProductSelected !=
                                    nearbyLocationProducts[index]
                                ? (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary.withOpacity(0.1)
                                    : Constants.darkSecondary.withOpacity(0.1))
                                : (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary),
                            foregroundColor:
                                Theme.of(context).brightness == Brightness.light
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
            child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height / 8,
                  );
                })
          )
        ],
      ),
    );
  }
}
