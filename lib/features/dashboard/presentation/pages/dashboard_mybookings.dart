import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';

class DashboardBookingPage extends StatefulWidget {
  const DashboardBookingPage({Key? key}) : super(key: key);

  @override
  State<DashboardBookingPage> createState() => _DashboardBookingPageState();
}

class _DashboardBookingPageState extends State<DashboardBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text("No Bookings Yet",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.urbanist(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightTextColor
                    : Constants.darkTextColor,
                fontStyle: FontStyle.normal)),
      ),
    );
  }
}
