// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, must_be_immutable, sort_child_properties_last, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final nameController;
  final priceController;
  DialogBox(
    {
      super.key,
      required this.onPressed,
      required this.nameController,
      required this.priceController,
    });
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 190,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
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