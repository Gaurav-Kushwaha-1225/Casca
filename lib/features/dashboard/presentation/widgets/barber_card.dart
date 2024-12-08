import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';

class BarberCard extends StatefulWidget {
  final GestureTapCallback func;
  final String imageLink;
  final String name;
  final stars;
  final String address;
  const BarberCard(
      {Key? key,
      required this.func,
      required this.imageLink,
      required this.name,
      required this.stars,
      required this.address})
      : super(key: key);

  @override
  State<BarberCard> createState() => _BarberCardState();
}

class _BarberCardState extends State<BarberCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.func,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.height / 6.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).brightness == Brightness.light
              ? Constants.lightCardFillColor
              : Constants.darkCardFillColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(23),
                  child: Image.network(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    widget.imageLink,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.network(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                        'https://jakijellz.com/wp-content/uploads/2018/02/Professional-Barber-1.png',
                      );
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) / 2.8,
                    child: Text(
                      widget.name,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightTextColor
                                  : Constants.darkTextColor,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Text(
                    widget.address,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: GoogleFonts.urbanist(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 15,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightSecondary
                                  : Constants.darkSecondary,
                        ),
                        Text(
                          '1.5 km',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.urbanist(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star_half_rounded,
                          size: 15,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Constants.lightSecondary
                                  : Constants.darkSecondary,
                        ),
                        Text(
                          widget.stars.toString(),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.urbanist(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border_rounded,
                size: 23,
                color: Theme.of(context).brightness == Brightness.light
                    ? Constants.lightSecondary
                    : Constants.darkSecondary,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
