import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  static const String id = "Calendar";
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
             toolbarHeight: 100,
            backgroundColor: Colors.white10,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Taqvim',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TabBar(
                  tabs: [
                    Tab(
                      text: "1-tur o'yinlari",
                    ),
                    Tab(
                      text: "2-tur o'yinlari",
                    ),
                    Tab(
                      text: "3-tur o'yinlari",
                    ),
                  ],
                  dividerHeight: 0,
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(),
            Container(),
            Container(),
          ]),
        ));
  }
}
