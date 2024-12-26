import 'dart:convert';
import 'dart:math';

import 'package:Casca/config/routes/routes_consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';
import '../../data/models/barber_model.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/barber_card.dart';

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({Key? key}) : super(key: key);

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  List productsAvailable = [
    {"product": "Haircut", "icon": CupertinoIcons.scissors},
    {"product": "Make Up", "icon": Icons.brush_rounded},
    {"product": "Manicure", "icon": CupertinoIcons.paintbrush},
    {"product": "Massage", "icon": CupertinoIcons.color_filter},
  ];

  List nearbyLocationProducts = [
    "All",
    "Haircut",
    "Make Up",
    "Manicure",
    "Massage"
  ];
  String nearbyLocationProductSelected = "All";

  // List<Map<String, dynamic>>? dataList;
  // bool isLoading = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   CascaBarberDB.connect();
  //   _loadData();
  // }
  //
  // Future<void> _loadData() async {
  //   final data = await CascaBarberDB.getData();
  //   setState(() {
  //     dataList = data;
  //     isLoading = false;
  //   });
  //   await CascaBarberDB.close();
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3));
    BlocProvider.of<HomeBloc>(context).add(GetBarbersEvent());
  }

  int iterator = Random().nextInt(100);

  List<Barber> barbers = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // scrollBehavior: ScrollBehavior(),
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
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                            CascaRoutesNames.servicesPage,
                            pathParameters: {
                              'service':
                                  jsonEncode(productsAvailable[i]["product"])
                            });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27.5),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightSecondary.withOpacity(0.2)
                                  : Constants.darkSecondary.withOpacity(0.2),
                            ),
                            child: Center(
                              child: Icon(
                                productsAvailable[i]["icon"],
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
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
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightSecondary
                                  : Constants.darkSecondary,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ],
              ),
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
            child: SizedBox(
              height: 18,
            ),
          ),
          SliverToBoxAdapter(child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is BarbersLoading) {
                return Container(
                  height: MediaQuery.of(context).size.height - 445,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is BarbersLoaded) {
                barbers = state.barbers;
                return ListView.separated(
                    itemCount: barbers.isNotEmpty ? 15 : 0,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (context, index) {
                      if (barbers[iterator]
                              .listOfServices
                              .contains(nearbyLocationProductSelected) ||
                          nearbyLocationProductSelected == 'All') {
                        return SizedBox(
                          height: 15,
                        );
                      }
                      return SizedBox();
                    },
                    itemBuilder: (context, index) {
                      iterator = Random().nextInt(100);
                      if (barbers[iterator]
                              .listOfServices
                              .contains(nearbyLocationProductSelected) ||
                          nearbyLocationProductSelected == 'All') {
                        return BarberCard(
                            id: state.barbers[index].id,
                            func: () {
                              String barberJson = jsonEncode(state.barbers[index].toMap());
                              GoRouter.of(context).pushNamed(
                                  CascaRoutesNames.barberDetailsPage1,
                                  pathParameters: {
                                    'barberJson': barberJson
                                  });
                            },
                            imageLink: state.barbers[index].imageLink,
                            name: state.barbers[index].name,
                            stars: state.barbers[index].stars,
                            address: state.barbers[index].address);
                      }
                      return Container();
                    });
              } else if (state is BarbersError) {
                return Container(
                  height: MediaQuery.of(context).size.height - 445,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height - 445,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 18,
            ),
          ),
        ],
      ),
    );
  }
}
