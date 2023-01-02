import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetail extends StatelessWidget {
  DoctorDetail({Key? key}) : super(key: key);

  List review=[
    ["Liam Dawson","lib/icons/man.png","1 day ago","4.6","Dr Viola Dunn is very good for pregnancy test and my wife gets best service"],
    ["Audrey Royal","lib/icons/woman.png","2 day ago","4.4","Dr Viola Dunn is very good for pregnancy test and my wife gets best service"],
    ["Andy Marie","lib/icons/man1.png","4 day ago","4.8","Dr Viola Dunn is very good for pregnancy test and my wife gets best service"],
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: height*0.34,
                  color: Colors.deepPurple.shade400,
                  padding: EdgeInsets.only(right: 15,top: 10,left: 5,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Get.back();
                          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                          Expanded(child: Container()),
                          Icon(Icons.more_vert,color: Colors.white,size: 28,)
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white
                                .withOpacity(0.2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                AssetImage(Get.arguments['image']),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(height: 10,),
                      Text(Get.arguments['name'],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                      SizedBox(height: 3,),
                      Text(Get.arguments['specialist'],style: TextStyle(color: Colors.grey.shade300,fontSize: 16),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade400.withOpacity(0.6)
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.call,color: Colors.white,)),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400.withOpacity(0.6)
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.chat,color: Colors.white,)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height*0.34,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.deepPurple.shade400,
                ),
              ),
              Positioned(
                top: height*0.34,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    )
                  ),
                  padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About Doctor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: 3,),
                      Text(Get.arguments['about'],style: TextStyle(fontSize: 16,color: Colors.grey.shade600),),
                      SizedBox(height: 10,),
                      //review Text
                      Row(
                        children: [
                          Text("Reviews",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                          SizedBox(width: 5,),
                          Icon(Icons.star,color: Colors.orange,),
                          SizedBox(width: 3,),
                          Text(Get.arguments['rating'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          Text("(124)",style: TextStyle(fontSize: 17,color: Colors.grey.shade600),),
                          Expanded(child: Container()),
                          Text("See All",style: TextStyle(fontSize: 18,color: Colors.deepPurple.shade900),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      //reviews
                      SizedBox(
                        height: 125,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: review.length,
                          itemBuilder: (_,index){
                            return Container(
                              height: 125,
                              width: width*0.8,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent.shade100.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.pinkAccent.shade100.withOpacity(0.3),
                                            shape: BoxShape.circle
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(review[index][1],height: 35,),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(review[index][0],style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600),),
                                          Text(review[index][2],style: TextStyle(fontSize: 17,color: Colors.grey.shade500),)
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey.shade400.withOpacity(.4)
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,color: Colors.orange,),
                                            SizedBox(width: 4,),
                                            Text(review[index][3],style: TextStyle(fontSize: 17),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4,),
                                  Text(review[index][4],style: TextStyle(fontSize: 16,color: Colors.grey.shade500),)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Location",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500),),
                      SizedBox(height: 8,),
                      //location
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent.shade100.withOpacity(0.3),
                            radius: 30,
                            child: Icon(Icons.location_on,color: Colors.deepPurple,size: 35,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Get.arguments['center'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text(Get.arguments['location'],style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 3,),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 105,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 10
                )
              ]
            ),
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Consultation fee",style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                    Expanded(child: Container()),
                    Text("\$"+Get.arguments['fare'],style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),)
                  ],
                ),
                SizedBox(height: 7,),
                MaterialButton(
                    onPressed: (){},
                  child: Text("Book Appointment",style: TextStyle(fontSize: 18,color: Colors.white),),
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  minWidth: width,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
