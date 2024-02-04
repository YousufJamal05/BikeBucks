// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

class AltDialogBox extends StatelessWidget {
  final countController;
  final priceController;
  VoidCallback onPressed;
  AltDialogBox(
    {
      super.key,
      required this.countController,
      required this.priceController,
      required this.onPressed,
    }
    );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: SizedBox(
        height: 190,
        child: Column(
          children: [
            TextField(
              controller: countController,
              decoration: InputDecoration(
                hintText: 'Count',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: MaterialButton(
                      color: Color.fromRGBO(235, 242, 250,0.9),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF064789),
                        ),
                      ),
                      onPressed: onPressed,
                    ),
                  ),
                  MaterialButton(
                    color: Color.fromRGBO(235, 242, 250,0.9),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF064789),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}