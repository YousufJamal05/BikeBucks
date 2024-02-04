// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mods_tracker/components/list.dart';

class ViewHelmets extends StatelessWidget {
  ViewHelmets({super.key,required this.helm});

  List helm;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(66, 122, 161,1),
      appBar: AppBar(
        backgroundColor: Color(0xFF064789),
        iconTheme: IconThemeData(color: Color.fromRGBO(235, 242, 250,1)),
      ),
      body: ListView.builder(
        itemCount: helm.length,
        itemBuilder: (context, index) {
          return Things(
            name: helm[index][0],
            price: helm[index][1],
          );
        },
      ),
    );
  }
}