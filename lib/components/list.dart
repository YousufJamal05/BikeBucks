// ignore_for_file: must_be_immutable, prefer_const_constructors, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class Things extends StatelessWidget {
  String name;
  double price;
  Things(
    {
      super.key,
      required this.name,
      required this.price,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 10,right: 10),
      child: Container(
        height: 50,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color.fromRGBO(235, 242, 250,0.9), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${name}(${price})',
            style: TextStyle(
              color: Color(0xFF064789),
              fontFamily: 'Poppins',
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}