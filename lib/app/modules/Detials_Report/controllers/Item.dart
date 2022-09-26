import 'package:fawry_app/Shared/color/colors.dart';
import 'package:flutter/material.dart';

class Item {
  IconData img;

  Item(
    this.img,
  );
}
class SalesData{
 late double Data;
 late double Total;

 SalesData(this.Data,
 this.Total) ;
}


// class GDPData {
//   GDPData(this.continent, this.gdp);
//   final String continent;
//   final int gdp;
// }