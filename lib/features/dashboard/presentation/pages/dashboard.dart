import 'dart:convert';
import 'dart:developer';

import 'package:Casca/features/dashboard/presentation/pages/dashboard_explore.dart';
import 'package:Casca/features/dashboard/presentation/pages/dashboard_home.dart';
import 'package:Casca/features/dashboard/presentation/pages/dashboard_inbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes_consts.dart';
import '../../../../utils/consts.dart';
import '../../../../widgets/app_bar.dart';
import '../../../authentication/domain/entities/user.dart';
import 'dashboard_mybookings.dart';
import 'dashboard_profile.dart';

class DashboardPage extends StatefulWidget {
  Map<String, dynamic> user;
  DashboardPage({Key? key, required this.user}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentBottomNavigationPage = 0;

  @override
  Widget build(BuildContext context) {
    User currentUser = User.fromJson(widget.user);
    final List<Widget> dashboard_pages = [
      DashboardHomePage(),
      DashboardExplorePage(),
      DashboardBookingPage(),
      // DashboardInboxPage(),
      DashboardProfilePage(user: widget.user),
    ];
    final appBarHeading = ["Casca", "Explore", "Bookings", "Profile"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CustomAppBar(
          text: appBarHeading[currentBottomNavigationPage],
          leadingFunc: () {
            log("Leading Function Called");
          },
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(
                    CascaRoutesNames.notificationBookmarkPage,
                    pathParameters: {'service': jsonEncode("Notification")});
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
                GoRouter.of(context).pushNamed(
                    CascaRoutesNames.notificationBookmarkPage,
                    pathParameters: {'service': jsonEncode("Bookmark")});
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
      body: dashboard_pages[currentBottomNavigationPage],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentBottomNavigationPage = index;
              });
            },
            currentIndex: currentBottomNavigationPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightPrimary
                : Constants.darkPrimary,
            selectedItemColor: Theme.of(context).brightness == Brightness.light
                ? Constants.lightSecondary
                : Constants.darkSecondary,
            unselectedItemColor: Colors.grey,
            iconSize: 24,
            selectedLabelStyle: GoogleFonts.urbanist(
                fontSize: 13,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightSecondary
                    : Constants.darkSecondary,
                fontStyle: FontStyle.normal),
            unselectedLabelStyle: GoogleFonts.urbanist(
                fontSize: 10,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightSecondary
                    : Constants.darkSecondary,
                fontStyle: FontStyle.normal),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.location_solid), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.text_badge_checkmark),
                  label: "My Booking"),
              // BottomNavigationBarItem(
              //     icon: Icon(CupertinoIcons.text_bubble), label: "Inbox"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
            ]),
      ),
    );
  }
}
