import 'package:Casca/features/dashboard/presentation/widgets/barber_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';
import '../bloc/explore/explore_bloc.dart';

class DashboardExplorePage extends StatefulWidget {
  const DashboardExplorePage({Key? key}) : super(key: key);

  @override
  State<DashboardExplorePage> createState() => _DashboardExplorePageState();
}

class _DashboardExplorePageState extends State<DashboardExplorePage> {
  final TextEditingController barberSearchController = TextEditingController();
  final GlobalKey<FormState> searchKey = GlobalKey();

  List<String> categories = [
    "All",
    "Haircut",
    "Make Up",
    "Manicure",
    "Massage"
  ];

  List<dynamic> searchResults = [];

  String categorySelected = "All";

  List<dynamic> ratings = ["All", "5", "4", "3", "2", "1"];

  String ratingSelected = "All";

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        context: ctx,
        builder: (ctx) => BottomSheet(
              onClosing: () {},
              enableDrag: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              builder: (ctx) => StatefulBuilder(
                builder: (ctx, setState) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  alignment: Alignment.topCenter,
                  margin:
                      const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                  // padding: ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Filter",
                        style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightTextColor
                                    : Constants.darkTextColor,
                            fontStyle: FontStyle.normal),
                      ),
                      Divider(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightBorderColor
                                  : Constants.darkBorderColor),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Category",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
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
                                      categorySelected = categories[index];
                                    });
                                  },
                                  child: Text(
                                    categories[index],
                                    style: GoogleFonts.urbanist(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: categorySelected !=
                                                categories[index]
                                            ? (Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? Constants.lightSecondary
                                                : Constants.darkSecondary)
                                            : Constants.lightPrimary,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          categorySelected != categories[index]
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
                                      foregroundColor:
                                          Theme.of(context).brightness ==
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
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Rating",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: ratings.length,
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
                                      ratingSelected = ratings[index];
                                    });
                                  },
                                  child: Text(
                                    ratings[index],
                                    style: GoogleFonts.urbanist(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: ratingSelected != ratings[index]
                                            ? (Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? Constants.lightSecondary
                                                : Constants.darkSecondary)
                                            : Constants.lightPrimary,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          ratingSelected != ratings[index]
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
                                      foregroundColor:
                                          Theme.of(context).brightness ==
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightBorderColor
                                    : Constants.darkBorderColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                categorySelected = "All";
                                ratingSelected = "All";
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary.withOpacity(0.2)
                                    : Constants.darkSecondary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              alignment: Alignment.center,
                              child: Text("Reset",
                                  style: GoogleFonts.urbanist(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Constants.lightSecondary,
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pop();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Constants.lightSecondary
                                    : Constants.darkSecondary,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              alignment: Alignment.center,
                              child: Text("Submit",
                                  style: GoogleFonts.urbanist(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: searchKey,
            child: TextFormField(
                controller: barberSearchController,
                cursorColor: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    BlocProvider.of<ExploreBloc>(context).add(
                        GetBarbersSearchEvent(
                            searchValue: value,
                            rating: ratingSelected,
                            category: categorySelected));
                  });
                },
                style: GoogleFonts.urbanist(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightTextColor
                        : Constants.darkTextColor,
                    letterSpacing: 1.2),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightBorderColor
                                  : Constants.darkBorderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      gapPadding: 24),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade600
                        : Colors.grey.shade300,
                    size: 18,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      return _show(context);
                    },
                    child: Icon(
                      Icons.filter_alt_rounded,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade300,
                      size: 18,
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade600
                          : Colors.grey.shade300,
                      letterSpacing: 1.2),
                  fillColor: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightCardFillColor
                      : Constants.darkCardFillColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightSecondary
                                  : Constants.darkSecondary),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      gapPadding: 24),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
              color: Theme.of(context).brightness == Brightness.light
                  ? Constants.lightBorderColor
                  : Constants.darkBorderColor),
          SizedBox(
            height: 15,
          ),
          barberSearchController.text == ""
              ? Expanded(
                  child: Center(
                    child: Text(
                        "Type above to search barbers.\nEmpty results found.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.urbanist(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Constants.lightTextColor
                                    : Constants.darkTextColor,
                            fontStyle: FontStyle.normal)),
                  ),
                )
              : BlocBuilder<ExploreBloc, ExploreState>(
                  builder: (context, state) {
                    if (state is BarbersLoading) {
                      return Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is BarbersLoaded) {
                      return state.barbers.isEmpty &&
                              barberSearchController.text != ""
                          ? Expanded(
                              child: Center(
                                child: Text(
                                    "Empty results found. \nNothing matched your typed text.",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.urbanist(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Constants.lightTextColor
                                            : Constants.darkTextColor,
                                        fontStyle: FontStyle.normal)),
                              ),
                            )
                          : Expanded(
                              child: ListView.separated(
                                itemCount: state.barbers.length,
                                primary: true,
                                // shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 15,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return BarberCard(
                                      id: state.barbers[index].id,
                                      func: () {},
                                      imageLink: state.barbers[index].imageLink,
                                      name: state.barbers[index].name,
                                      stars: state.barbers[index].stars,
                                      address: state.barbers[index].address);
                                },
                              ),
                            );
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height - 350,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                )
        ],
      ),
    );
  }
}
