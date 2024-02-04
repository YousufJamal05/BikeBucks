// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Data
{
  List modifications=[['none',0.0]];
  List helmets =[['none',0.0]];
  List gear =[['none',0.0]];
  double totalCost = 0;
  double miscellaneousCost = 0;
  double helmetCost = 0;
  double modsCost = 0;
  double apparelCost = 0;
  double serviceCost = 0;
  double tuningCost = 0;
  double modItems = 0;
  double helmetCount = 0;
  double tuningCount = 0;
  double serviceCount = 0;
  double apparelCount = 0;

  void initData() async
  {
    final url= Uri.https('fir-app-f2f13-default-rtdb.firebaseio.com', 'shapatar.json');
    final response= await http.post(
      url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode({
       'modifications': modifications,
       'helmets': helmets,
       'gear': gear,
       'totalCost': totalCost,
       'miscellaneousCost': miscellaneousCost,
       'helmetCost': helmetCost,
       'modsCost': modsCost,
       'apparelCost': apparelCost,
       'serviceCost': serviceCost,
       'tuningCost': tuningCost,
       'modItems': modItems,
       'helmetCount': helmetCount,
       'serviceCount': serviceCount,
       'apparelCount': apparelCount,
       'tuningCount': tuningCount,
      })
    );
  }

  void updateDB() async
  {
    final url= Uri.https('fir-app-f2f13-default-rtdb.firebaseio.com', 'shapatar.json');
    final response= await http.post(
      url,
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode({
       'modifications': modifications,
       'helmets': helmets,
       'gear': gear,
       'totalCost': totalCost,
       'miscellaneousCost': miscellaneousCost,
       'helmetCost': helmetCost,
       'modsCost': modsCost,
       'apparelCost': apparelCost,
       'serviceCost': serviceCost,
       'tuningCost': tuningCost,
       'modItems': modItems,
       'helmetCount': helmetCount,
       'serviceCount': serviceCount,
       'apparelCount': apparelCount,
       'tuningCount': tuningCount,
      })
    );
  }
  void getData() async 
  {
    final url= Uri.https('fir-app-f2f13-default-rtdb.firebaseio.com', 'shapatar.json');
    final response= await http.get(url);
    
    final Map<String, dynamic> retData = json.decode(response.body);

    print(response.body);

    for(final i in retData.entries)
    {
      modifications = i.value['modifications'];
      helmets= i.value['helmets'];
      gear= i.value['gear'];
      totalCost= i.value['totalCost'];
      miscellaneousCost= i.value['miscellaneousCost'];
      helmetCost= i.value['helmetCost'];
      modsCost= i.value['modsCost'];
      apparelCost= i.value['apparelCost'];
      serviceCost= i.value['serviceCost'];
      tuningCost=i.value['tuningCost'];
      modItems=i.value['modItems'];
      helmetCount= i.value['helmetCount'];
      serviceCount= i.value['serviceCount'];
      apparelCount= i.value['apparelCount'];
      tuningCount= i.value['tuningCount'];
    }
    print(helmetCost);
  }
}

