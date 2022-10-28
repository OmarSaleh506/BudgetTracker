import 'package:flutter/material.dart';

// final categories =[
// 'Health',
// 'Internet',
// 'Transportation',
// 'Grocery',
// 'Savings',
// 'other',
// ];


final List<Category> categories =[
Category(name: 'Health' , icon: Image.asset("lib/constants/icons/health.png")),
Category(name: 'Internet' , icon: Image.asset("lib/constants/icons/wifi.png")),
Category(name: 'Transportation' , icon: Image.asset("lib/constants/icons/transportation.png")),
Category(name: 'Grocery' , icon: Image.asset("lib/constants/icons/grocery.png")),
// Category(name: 'Savings' , icon: Icon(Icons.wifi)),
Category(name: 'other' , icon: Image.asset("lib/constants/icons/plus.png")),
];


class Category{
 final String? name;
 final Image? icon;

  Category({ this.name, this.icon});
 
}

