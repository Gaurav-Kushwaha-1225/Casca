import 'dart:math';

import 'package:Casca/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/consts.dart';
import '../../data/models/barber_model.dart';
import '../bloc/home/home_bloc.dart';
import 'barber_card.dart';

class HomeServicePage extends StatefulWidget {
  final String service;
  const HomeServicePage({Key? key, required this.service}) : super(key: key);

  @override
  State<HomeServicePage> createState() => _HomeServicePageState();
}

class _HomeServicePageState extends State<HomeServicePage> {
  List<Barber> barbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: CustomAppBar(
            text: widget.service,
            leadingFunc: () {
              Navigator.pop(context);
            },
            leadingIcon: Icons.arrow_back,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // scrollBehavior: ScrollBehavior(),
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is BarbersLoading) {
                    return Container(
                      height: MediaQuery.of(context).size.height - 445,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is BarbersLoaded) {
                    barbers = state.barbers;
                    return ListView.separated(
                        itemCount: barbers.length,
                        shrinkWrap: true,
                        primary: false,
                        separatorBuilder: (context, index) {
                          if (barbers[index]
                              .listOfServices
                              .contains(widget.service)) {
                            return SizedBox(
                              height: 15,
                            );
                          }
                          return SizedBox();
                        },
                        itemBuilder: (context, index) {
                          if (barbers[index]
                              .listOfServices
                              .contains(widget.service)) {
                            return BarberCard(
                                func: () {},
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
