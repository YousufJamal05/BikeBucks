// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:mods_tracker/dashboard.dart';
void main ()
{
  runApp(ModsTracker());
}

class ModsTracker extends StatelessWidget {
  const ModsTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashBoard(),
    );
  }
}