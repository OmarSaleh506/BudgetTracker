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
Category(name: 'Health' , icon: Image.asset("lib/constants/icons/health.png", height: 24, )),
Category(name: 'Internet' , icon: Image.asset("lib/constants/icons/wifi.png",height: 24,)),
Category(name: 'Transportation' , icon: Image.asset("lib/constants/icons/transportation.png",height: 24,)),
Category(name: 'Grocery' , icon: Image.asset("lib/constants/icons/grocery.png",height: 24,)),
Category(name: 'other' , icon: Image.asset("lib/constants/icons/plus.png",height: 24,)),

Category(name: 'other' , icon: Image.asset("lib/constants/icons/plus.png",height: 24,)),

Category(name: 'Health' , icon: Image.asset("lib/constants/icons/health.png", height: 24, )),
Category(name: 'Internet' , icon: Image.asset("lib/constants/icons/wifi.png",height: 24,)),
Category(name: 'Transportation' , icon: Image.asset("lib/constants/icons/transportation.png",height: 24,)),
Category(name: 'Grocery' , icon: Image.asset("lib/constants/icons/grocery.png",height: 24,)),
Category(name: 'other' , icon: Image.asset("lib/constants/icons/plus.png",height: 24,)),
Category(name: 'other' , icon: Image.asset("lib/constants/icons/plus.png",height: 24,)),
];


class Category{
 final String? name;
 final Image? icon;
  Color? color;

  Category({ this.name, this.icon, this.color});
 
}

