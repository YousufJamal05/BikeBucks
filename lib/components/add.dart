// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, body_might_complete_normally_nullable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mods_tracker/data/database.dart';
import 'package:mods_tracker/components/dialogBox.dart';
import 'package:mods_tracker/components/dialogBoxII.dart';

class AddMods extends StatelessWidget {
 AddMods(
  {
    super.key,
    required this.pController,
    required this.nController,
    required this.onPressedMod,
    required this.onPressedHelmet,
    required this.onPressedGear,
    required this.onPressedService,
    required this.onPressedTuning,
    required this.countController,
    required this.cpriceController,
  });

  TextEditingController pController= TextEditingController();
  TextEditingController nController= TextEditingController();
  TextEditingController countController= TextEditingController();
  TextEditingController cpriceController=TextEditingController();
  VoidCallback onPressedMod;
  VoidCallback onPressedHelmet;
  VoidCallback onPressedGear;
  VoidCallback onPressedTuning;
  VoidCallback onPressedService;
  Data db= Data();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 122, 161,1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(235, 242, 250,1)),
        backgroundColor: Color(0xFF064789),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Slidable(
             endActionPane: ActionPane(
             motion: StretchMotion(), 
             children: [
             SlidableAction(
              icon: Icons.add,
              backgroundColor: Color(0xFF064789),
              borderRadius: BorderRadius.circular(18),
              onPressed: (context) {showDialog(context: context, builder: ((context) => DialogBox(nameController: nController,priceController: pController,onPressed: onPressedMod,)));},
            ),
            ],
            ),
            child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromRGBO(235, 242, 250,0.9), 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Text(
                    'Modification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF064789),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Slidable(
             endActionPane: ActionPane(
             motion: StretchMotion(), 
             children: [
             SlidableAction(
              icon: Icons.add,
              backgroundColor: Color(0xFF064789),
              borderRadius: BorderRadius.circular(18),
              onPressed: (context) {showDialog(context: context, builder: ((context) => DialogBox(nameController: nController,priceController: pController,onPressed: onPressedHelmet,)));},
            ),
            ],
            ),
            child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromRGBO(235, 242, 250,0.9), 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Text(
                    'Helmet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF064789),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ),
            ),
          ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Slidable(
             endActionPane: ActionPane(
             motion: StretchMotion(), 
             children: [
             SlidableAction(
              icon: Icons.add,
              backgroundColor: Color(0xFF064789),
              borderRadius: BorderRadius.circular(18),
              onPressed: (context) {showDialog(context: context, builder: ((context) => DialogBox(nameController: nController,priceController: pController,onPressed: onPressedGear,)));},
            ),
            ],
            ),
            child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromRGBO(235, 242, 250,0.9), 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Text(
                    'Safety Gear',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF064789),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ),
            ),
          ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Slidable(
             endActionPane: ActionPane(
             motion: StretchMotion(), 
             children: [
             SlidableAction(
              icon: Icons.add,
              backgroundColor: Color(0xFF064789),
              borderRadius: BorderRadius.circular(18),
              onPressed: (context) {showDialog(context: context, builder: ((context) => AltDialogBox(countController: countController, priceController: cpriceController, onPressed: onPressedService)));},
            ),
            ],
            ),
            child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromRGBO(235, 242, 250,0.9), 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Text(
                    'Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF064789),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ),
            ),
          ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Slidable(
             endActionPane: ActionPane(
             motion: StretchMotion(), 
             children: [
             SlidableAction(
              icon: Icons.add,
              backgroundColor: Color(0xFF064789),
              borderRadius: BorderRadius.circular(18),
              onPressed: (context) {showDialog(context: context, builder: ((context) => AltDialogBox(countController: countController, priceController: cpriceController, onPressed: onPressedTuning)));},
            ),
            ],
            ),
            child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color.fromRGBO(235, 242, 250,0.9), 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Text(
                    'Tuning',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF064789),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}