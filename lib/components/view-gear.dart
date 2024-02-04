// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mods_tracker/components/list.dart';

class ViewGear extends StatelessWidget {
  ViewGear({super.key,required this.gears});

  List gears;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(66, 122, 161,1),
      appBar: AppBar(
        backgroundColor: Color(0xFF064789),
        iconTheme: IconThemeData(color: Color.fromRGBO(235, 242, 250,1)),
      ),
      body: ListView.builder(
        itemCount: gears.length,
        itemBuilder: (context, index) {
          return Things(
            name: gears[index][0],
            price: gears[index][1],
          );
        },
      ),
    );
  }
}