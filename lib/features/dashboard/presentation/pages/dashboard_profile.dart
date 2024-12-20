import 'dart:convert';
import 'dart:developer';

import 'package:Casca/config/routes/routes_consts.dart';
import 'package:Casca/features/authentication/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';

class DashboardProfilePage extends StatefulWidget {
  Map<String, dynamic> user;
  DashboardProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<DashboardProfilePage> createState() => _DashboardProfilePageState();
}

class _DashboardProfilePageState extends State<DashboardProfilePage> {
  @override
  Widget build(BuildContext context) {
    User user = User.fromJson(widget.user);
    final List profileListItems = [
      [
        Icons.person,
        "Edit Profile",
        Icon(
          Icons.navigate_next_rounded,
          size: 28,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
        ),
        () {
          GoRouter.of(context).pushNamed(CascaRoutesNames.updateUserPage,
              pathParameters: {'user': jsonEncode(widget.user)});
        }
      ],
      [
        Icons.notifications_none_rounded,
        "Notification",
        Icon(
          Icons.navigate_next_rounded,
          size: 28,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
        ),
        () {
          GoRouter.of(context).pushNamed(
              CascaRoutesNames.notificationBookmarkPage,
              pathParameters: {'service': jsonEncode("Notification")});
        }
      ],
      [
        Icons.payment_rounded,
        "Payment",
        Icon(
          Icons.navigate_next_rounded,
          size: 28,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
        ),
        () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Payment Page not Implemented")));
        }
      ],
      [
        Icons.security_rounded,
        "Security",
        Icon(
          Icons.navigate_next_rounded,
          size: 28,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
        ),
        () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Security Page not Implemented")));
        }
      ],
      [
        Icons.remove_red_eye_rounded,
        "Dark Mode",
        Switch(
          value: true,
          onChanged: (value) {},
          activeColor: Theme.of(context).brightness == Brightness.light
              ? Constants.lightSecondary
              : Constants.darkSecondary,
          activeTrackColor: Theme.of(context).brightness == Brightness.light
              ? Constants.lightSecondary.withOpacity(0.3)
              : Constants.darkSecondary.withOpacity(0.3),
          inactiveThumbColor: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
          inactiveTrackColor: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor.withOpacity(0.3)
              : Constants.darkTextColor.withOpacity(0.3),
        ),
        () {}
      ],
      [
        Icons.lock_outline_rounded,
        "Privacy Policy",
        Icon(
          Icons.navigate_next_rounded,
          size: 28,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
        ),
        () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Privacy Policy Page not Implemented"),
          ));
        }
      ],
      [
        Icons.person_add_alt_1_rounded,
        "Invite Friends",
        Icon(
          Icons.navigate_next_rounded,
          size: 28,
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightTextColor
              : Constants.darkTextColor,
        ),
        () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invite Friends Page not Implemented")));
        }
      ],
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
                clipBehavior: Clip.antiAlias,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: user.image != null
                    ? Image.memory(
                        base64Decode(user.image!),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                      )
                    : Image.asset(
                        Theme.of(context).brightness == Brightness.light
                            ? "assets/images/profile_light.png"
                            : "assets/images/profile_dark.png",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                      )),
          ),
          SliverToBoxAdapter(
            child: Text(
              user.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Constants.lightTextColor
                      : Constants.darkTextColor,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                user.email,
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Constants.lightTextColor
                        : Constants.darkTextColor,
                    fontStyle: FontStyle.normal),
              ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: profileListItems[index][3],
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              profileListItems[index][0],
                              size: 28,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                profileListItems[index][1],
                                style: GoogleFonts.urbanist(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Constants.lightTextColor
                                        : Constants.darkTextColor,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: 50,
                            )),
                            profileListItems[index][2]
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: profileListItems.length),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.logout_rounded,
                          size: 28,
                          color: Colors.redAccent,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.urbanist(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
