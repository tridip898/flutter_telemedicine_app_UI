import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:telemedicine_app/controller/bottom_nav_controller.dart';
import '../widget/symptoms_category.dart';
import 'doctor_detail.dart';
import 'schedule_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BottomNavController controller = Get.put(BottomNavController());
  List doctor = [];
  _readdata() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/doctor_list.json")
        .then((value) => setState(() {
              doctor = json.decode(value);
            }));
  }
  @override
  void initState() {
    // TODO: implement initState
    _readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Messages',
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Schedule',
                  onPressed: (){
                    Get.to(()=>SchedulePage());
                  },
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Setting',
                )
              ]
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          color: Colors.grey.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //app bar
              Row(
                children: [
                  Text(
                    "T. Bhowmik",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.waving_hand,
                    size: 37,
                    color: Colors.orange,
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("lib/icons/young-man.png"),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //category
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "lib/icons/plus.png",
                              height: 35,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "Clinic Visit",
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Make an aapointment",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 10)
                          ]),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 47,
                              width: 47,
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.home_filled,
                                color: Colors.deepPurple,
                                size: 30,
                              ))),
                          Expanded(child: Container()),
                          Text(
                            "Home Visit",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Call the doctor home",
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //symptoms text
              Text(
                "What are your symptoms?",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto Mono"),
              ),

              SizedBox(
                height: 15,
              ),

              //symptoms
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SymptomsCategory(
                      icon: "lib/icons/temperature.png",
                      text: "Temperature",
                    ),
                    SymptomsCategory(
                        icon: "lib/icons/snuffle.png", text: "Snuffle"),
                    SymptomsCategory(
                        icon: "lib/icons/headache.png", text: "Headache"),
                    SymptomsCategory(
                        icon: "lib/icons/puke.png", text: "Booming"),
                    SymptomsCategory(
                        icon: "lib/icons/cough.png", text: "Cough"),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),

              //popular doctors
              Text(
                "Popular doctors",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),

              SizedBox(
                height: 10,
              ),

              //doctor list
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.84,
                        crossAxisCount: 2),
                    itemCount: doctor.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (){
                          Get.to(()=>DoctorDetail(),arguments: {
                            'name':doctor[index]['name'].toString(),
                            'image':doctor[index]['image'].toString(),
                            'specialist':doctor[index]['specialist'].toString(),
                            'rating':doctor[index]['rating'].toString(),
                            'about':doctor[index]['about'].toString(),
                            'center':doctor[index]['center'].toString(),
                            'location':doctor[index]['location'].toString(),
                            'fare':doctor[index]['fare'].toString()
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ]),
                          padding: EdgeInsets.only(top: 12,bottom: 10,left: 10,right: 10),
                          child: Column(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.shade100
                                        .withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage(doctor[index]['image']),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(height: 10,),
                              Text(doctor[index]['name'],style: TextStyle(fontSize: 19),),
                              SizedBox(height: 5,),
                              Text(doctor[index]['specialist'],style: TextStyle(fontSize: 16,color: Colors.grey.shade500),),
                              SizedBox(height: 10,),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent.shade100.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.star,color: Colors.orange),
                                    Text(doctor[index]['rating'],style: TextStyle(fontSize: 17),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
