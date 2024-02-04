// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, unused_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable, must_call_super

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:countup/countup.dart';
import 'package:mods_tracker/components/add.dart';
import 'package:mods_tracker/components/view-gear.dart';
import 'package:mods_tracker/components/view-helmets.dart';
import 'package:mods_tracker/data/database.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:mods_tracker/components/view-mods.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final nController=TextEditingController();
  final pController=TextEditingController();
  final countController= TextEditingController();
  final cpriceController= TextEditingController();

  Data db= Data();  
  double temp=0;

  @override
  void initState()
  {
    db.getData();

    super.initState();
  }

  
  void addMOD()
  {
    double temp=0;
    String t= pController.text;
    temp= double.parse(t);
    setState(() {
      db.modifications.add([nController.text,temp]);
      db.modItems++;
      db.modsCost= db.modsCost+temp;
      db.totalCost= db.totalCost+temp;
      nController.clear();
      pController.clear();
      Navigator.pop(context);
    });
    db.updateDB();
  }
  void addHelmet()
  {
    double temp=0;
    String t= pController.text;
    temp= double.parse(t);
    setState(() {
      db.helmets.add([nController.text,temp]);
      db.helmetCount++;
      db.helmetCost= db.helmetCost+temp;
      db.totalCost= db.totalCost + temp;
      nController.clear();
      pController.clear();
      Navigator.pop(context);
    });
    db.updateDB();
  }
  void addGear()
  {
    double temp=0;
    String t= pController.text;
    temp= double.parse(t);
    setState(() {
      db.gear.add([nController.text,temp]);
      db.apparelCount++;
      db.apparelCost += temp;
      db.totalCost += temp;
      nController.clear();
      pController.clear();
      Navigator.pop(context);
    });
    db.updateDB();
  }
  void addTuning()
  {
    double x=0;
    double y=0;
    x= double.parse(cpriceController.text);
    y= double.parse(countController.text);
    double totalCost;
    totalCost=x*y;
    setState(() {
      db.tuningCount += y;
      db.tuningCost += totalCost;
      db.totalCost += totalCost;
      cpriceController.clear();
      countController.clear();
      Navigator.pop(context);
    });
    db.updateDB();
  }
  void addService()
  {
    double x=0;
    double y=0;
    x= double.parse(cpriceController.text);
    y= double.parse(countController.text);
    double totalCost;
    totalCost=x*y;
    setState(() {
      db.serviceCount += y;
      db.serviceCost += totalCost;
      db.totalCost += totalCost;
      cpriceController.clear();
      countController.clear();
      Navigator.pop(context);
    });
    db.updateDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 122, 161,1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(235, 242, 250,1)),
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color.fromRGBO(235, 242, 250,1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF064789),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(66, 122, 161,1),
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.motorcycle,size: 40,color: Color.fromRGBO(235, 242, 250,1),),
                  //Icon(Icons.sports_motorsports,size: 40,color: Color.fromRGBO(235, 242, 250,1),)
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMods(pController: pController,nController: nController,onPressedMod: addMOD,onPressedGear: addGear,onPressedHelmet: addHelmet,onPressedService: addService,onPressedTuning: addTuning,countController: countController,cpriceController: cpriceController,)));
              },
              leading: Icon(
                Icons.add,
                color: Color.fromRGBO(235, 242, 250,1),
                ),
              title: Text(
                'Add',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(235, 242, 250,1),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewMods(mod: db.modifications,))));
              },
              leading: Icon(
                CupertinoIcons.hammer_fill,
                color: Color.fromRGBO(235, 242, 250,1),),
              title: Text(
                'View Modifications',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(235, 242, 250,1),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewHelmets(helm: db.helmets,)));
              },
              leading: Icon(Icons.sports_motorsports, color: Color.fromRGBO(235, 242, 250,1),),
              title: Text(
                'View Helmets',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(235, 242, 250,0.9),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewGear(gears: db.gear,)));
              },
              leading: Icon(Icons.shield, color: Color.fromRGBO(235, 242, 250,1),),
              title: Text(
                'View Gear',
                style: TextStyle(
                  color: Color.fromRGBO(235, 242, 250,1),
                  fontFamily: 'Poppins',
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10,left: 10,right: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 242, 250,1),
                borderRadius: BorderRadius.circular(18)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      'Total Spendings: ',
                      style: TextStyle(
                        color: Color(0xFF064789),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      )
                      ),
                      Countup(
                        begin: 0,
                        end: db.totalCost,
                        duration: Duration(seconds: 3),
                        separator: ',',
                        style: TextStyle(
                          color: Color(0xFF064789),
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Icon(CupertinoIcons.hammer_fill,color: Color.fromRGBO(235, 242, 250,1),),
                Text(
                  '  Modifications.',
                  style: TextStyle(
                    color: Color.fromRGBO(235, 242, 250,1),
                    fontFamily: 'Poppins',
                    fontSize: 24
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,left:10,right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 242, 250,0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              height: 200,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [                     
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 15),
                        child: Text(
                          'Spent (Rs.)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10, 
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           onGetText: (p0) {
                             return Text(
                              '${db.modsCost.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20,left:30,bottom: 15),
                        child: Text(
                          'Mods#',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10,
                           onGetText: (p0) {
                             return Text(
                              '${db.modItems.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Icon(Icons.sports_motorsports,color: Color.fromRGBO(235, 242, 250,1),),
                Text(
                  '  Helmets.',
                  style: TextStyle(
                    color: Color.fromRGBO(235, 242, 250,1),
                    fontFamily: 'Poppins',
                    fontSize: 24
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,left:10,right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 242, 250,0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              height: 200,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [                     
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 15),
                        child: Text(
                          'Spent (Rs.)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10, 
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           onGetText: (p0) {
                             return Text(
                              '${db.helmetCost.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20,left:30,bottom: 15),
                        child: Text(
                          'Helmet#',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10,
                           onGetText: (p0) {
                             return Text(
                              '${db.helmetCount.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Icon(Icons.shield,color: Color.fromRGBO(235, 242, 250,1),),
                Text(
                  '  Safety Gear',
                  style: TextStyle(
                    color: Color.fromRGBO(235, 242, 250,1),
                    fontFamily: 'Poppins',
                    fontSize: 24
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,left:10,right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 242, 250,0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              height: 200,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [                     
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 15),
                        child: Text(
                          'Spent (Rs.)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10, 
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           onGetText: (p0) {
                             return Text(
                              '${db.apparelCost.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20,left:30,bottom: 15),
                        child: Text(
                          'Gear#',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10,
                           onGetText: (p0) {
                             return Text(
                              '${db.apparelCount.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Icon(Icons.water_drop,color: Color.fromRGBO(235, 242, 250,1),),
                Text(
                  '  Miscellaneous',
                  style: TextStyle(
                    color: Color.fromRGBO(235, 242, 250,1),
                    fontFamily: 'Poppins',
                    fontSize: 24
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,left:10,right: 10,bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 242, 250,0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              height: 350,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [                     
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 15),
                        child: Text(
                          'Tuning (Rs.)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10, 
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           onGetText: (p0) {
                             return Text(
                              '${db.tuningCost.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 15),
                        child: Text(
                          'Service (Rs.)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10, 
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           onGetText: (p0) {
                             return Text(
                              '${db.serviceCost.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20,left:30,bottom: 15),
                        child: Text(
                          'Tuning#',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10,
                           onGetText: (p0) {
                             return Text(
                              '${db.tuningCount.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,left:30,bottom: 15),
                        child: Text(
                          'Service#',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xFF064789),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30),
                        child: SimpleCircularProgressBar(
                           progressColors: [
                             Colors.lightBlueAccent,
                             Colors.lightBlue,
                             Colors.blueAccent,
                             Colors.blue,
                           ],
                           fullProgressColor: Colors.purple,
                           mergeMode: true,
                           progressStrokeWidth: 10,
                           backStrokeWidth: 10,
                           onGetText: (p0) {
                             return Text(
                              '${db.serviceCount.toInt()}',
                              style: TextStyle(
                                color: Color(0xFF064789),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                              )
                             );
                           },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}