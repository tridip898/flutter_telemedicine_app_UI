import 'dart:convert';

import 'package:flutter/material.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  List doctor = [];
  _readdata() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/future_visit.json")
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text("Nearest visit",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              SizedBox(height: 15,),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 05
                    )
                  ]
                ),
                padding: EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr. Chris Frazier",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                            Text("Therapist",style: TextStyle(fontSize: 17,color: Colors.grey.shade500),)
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.shade100.withOpacity(0.3),
                            shape: BoxShape.circle
                          ),
                          padding: EdgeInsets.all(5),
                          child: Image.asset("lib/icons/doctor_male1.png",height: 50,),
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month_outlined,color: Colors.grey.shade500,),
                            SizedBox(width: 5,),
                            Text("05/10/2021",style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time_filled_outlined,color: Colors.grey.shade500,),
                            SizedBox(width: 5,),
                            Text("10:30 AM",style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.noise_control_off,color: Colors.green,),
                            SizedBox(width: 5,),
                            Text("Confirmed",style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: MaterialButton(
                            onPressed: (){},
                            height: 50,
                            child: Text("Cancel",style: TextStyle(fontSize: 18,color: Colors.grey.shade800),),
                            color: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 1,
                          child: MaterialButton(
                            onPressed: (){},
                            height: 50,
                            child: Text("Reshedule",style: TextStyle(fontSize: 18,color: Colors.white),),
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text("Future visits",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              SizedBox(height: 13,),
              Expanded(
                child: ListView.builder(
                  itemCount: doctor.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (_,index){
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 05
                          )
                        ]
                    ),
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctor[index]['name'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                                Text(doctor[index]['specialist'],style: TextStyle(fontSize: 17,color: Colors.grey.shade500),)
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent.shade100.withOpacity(0.3),
                                  shape: BoxShape.circle
                              ),
                              padding: EdgeInsets.all(5),
                              child: Image.asset(doctor[index]['image'],height: 50,),
                            )
                          ],
                        ),
                        Divider(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined,color: Colors.grey.shade500,),
                                SizedBox(width: 5,),
                                Text(doctor[index]['date'],style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_time_filled_outlined,color: Colors.grey.shade500,),
                                SizedBox(width: 5,),
                                Text(doctor[index]['time'],style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.noise_control_off,color: Colors.green,),
                                SizedBox(width: 5,),
                                Text("Confirmed",style: TextStyle(fontSize: 16,color: Colors.grey.shade600),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 50,
                                child: Text("Cancel",style: TextStyle(fontSize: 18,color: Colors.grey.shade800),),
                                color: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: MaterialButton(
                                onPressed: (){},
                                height: 50,
                                child: Text("Reshedule",style: TextStyle(fontSize: 18,color: Colors.white),),
                                color: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        )
      ),
    );
  }
}
