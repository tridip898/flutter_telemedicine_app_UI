import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:telemedicine_app/controller/bottom_nav_controller.dart';
import 'package:telemedicine_app/screen/home_screen.dart';
import 'package:telemedicine_app/screen/upcoming_screen.dart';

import '../widget/myTab.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final BottomNavController controller = Get.put(BottomNavController());

  List<Widget> mytab = [
    MyTab(
      text: "Upcoming",
    ),
    MyTab(
      text: "Completed",
    ),
    MyTab(
      text: "Canceled",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: mytab.length,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 75,
            color: Colors.white,
            child: GNav(
                tabBorderRadius: 15,
                curve: Curves.easeOutExpo,
                duration: Duration(milliseconds: 200),
                gap: 8,
                color: Colors.grey[500],
                activeColor: Colors.deepPurple,
                iconSize: 28,
                textStyle: TextStyle(fontSize: 18),
                tabBackgroundColor: Colors.deepPurple.withOpacity(0.1),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                selectedIndex: controller.selectedIndex,
                tabs: [
                  GButton(
                    icon: Icons.home_filled,
                    text: 'Home',
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                  ),
                  GButton(
                    icon: Icons.chat,
                    text: 'Messages',
                  ),
                  GButton(
                    icon: Icons.calendar_month_outlined,
                    text: 'Schedule',
                    onPressed: () {
                      Get.to(() => SchedulePage());
                    },
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Setting',
                  )
                ]),
          ),
          body: Container(
            height: height,
            width: width,
            padding: EdgeInsets.only(top: 20, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Schedule",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),

                //tabbar
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: TabBar(
                    tabs: mytab,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade800,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple
                    ),
                  ),
                ),
                //tabbarView
                Expanded(
                    child: TabBarView(
                        children: [
                          UpcomingScreen(),
                          UpcomingScreen(),
                          UpcomingScreen(),
                        ]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
