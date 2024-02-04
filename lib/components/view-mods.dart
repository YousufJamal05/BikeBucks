// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:mods_tracker/data/database.dart';
import 'package:mods_tracker/components/list.dart';

class ViewMods extends StatelessWidget {
  ViewMods({super.key,required this.mod});

  List mod;

  Data db= Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 122, 161,1),
      appBar: AppBar(
        backgroundColor: Color(0xFF064789),
        iconTheme: IconThemeData(color: Color.fromRGBO(235, 242, 250,1)),
      ),
      body: ListView.builder(
        itemCount: mod.length,
        itemBuilder: (context, index) {
          return Things(
            name: mod[index][0],
            price: mod[index][1],
          );
        },
      ),
    );
  }
}