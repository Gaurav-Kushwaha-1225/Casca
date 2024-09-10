import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';
import '../../../../widgets/app_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CustomAppBar(
          text: "Casca",
          leadingFunc: () {
            log("Leading Function Called");
          },
          actions: [
            IconButton(
              onPressed: () {
                log("Notification Button Pressed");
              },
              icon: Icon(
                Icons.notifications_none_rounded,
                size: 28,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            IconButton(
              onPressed: () {
                log("Notification Button Pressed");
              },
              icon: Icon(
                Icons.bookmark_border_rounded,
                size: 28,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      body: Padding(
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
                    Column(
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
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.scissors,
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
                          "Haircuts",
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        )
                      ],
                    ),
                    Column(
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
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.brush_rounded,
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
                          "Make Up",
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        )
                      ],
                    ),
                    Column(
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
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.paintbrush,
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
                          "Manicure",
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        )
                      ],
                    ),
                    Column(
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
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.color_filter,
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
                          "Massage",
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                              fontStyle: FontStyle.normal),
                        )
                      ],
                    )
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
