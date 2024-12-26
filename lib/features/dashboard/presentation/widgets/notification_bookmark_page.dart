import 'dart:convert';
import 'dart:math';

import 'package:Casca/features/dashboard/data/data_sources/barber_database.dart';
import 'package:Casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/routes_consts.dart';
import '../bloc/home/home_bloc.dart';
import 'barber_card.dart';

class NotificationBookmarkPage extends StatefulWidget {
  final String service;
  const NotificationBookmarkPage({Key? key, required this.service})
      : super(key: key);

  @override
  State<NotificationBookmarkPage> createState() =>
      _NotificationBookmarkPageState();
}

class _NotificationBookmarkPageState extends State<NotificationBookmarkPage> {
  final storage = FlutterSecureStorage();
  List<String> savedBarbers = [];

  @override
  void initState() {
    if (widget.service == "Bookmark") {
      savedBarbersList();
      print(savedBarbers.toString());
    }
    super.initState();
  }

  Future<void> savedBarbersList() async {
    final token = await storage.read(key: "savedBarbers");

    if (token != null) {
      try {
        var decodedList = jsonDecode(token);
        for (var item in decodedList) {
          if (item is String) {
            savedBarbers.add(item);
          }
        }
        setState(() {
          BlocProvider.of<HomeBloc>(context)
              .add(GetSavedBarbersEvent(barbers: savedBarbers));
        });
      } catch (e) {
        savedBarbers = [];
      }
    } else {
      savedBarbers = [];
    }
  }

  int iterator = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: CustomAppBar(
            text: widget.service,
            leadingFunc: () {
              GoRouter.of(context).pop();
            },
            leadingIcon: Icons.arrow_back,
          )),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: widget.service == "Bookmark"
              ? BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is SavedBarbersLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SavedBarbersLoaded) {
                      return ListView.separated(
                          itemCount: state.barbers.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15,
                            );
                          },
                          itemBuilder: (context, index) {
                            return BarberCard(
                                id: state.barbers[index].id,
                                func: () {
                                  String barberJson =
                                      jsonEncode(state.barbers[index].toMap());
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
                          });
                    } else if (state is SavedBarbersError) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : Expanded(child: Center(child: CircularProgressIndicator()))),
    );
  }
}
