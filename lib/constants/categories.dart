import 'package:flutter/material.dart';

final categories =[
'Health',
'Internet',
'Transportation',
'Grocery',
'Savings',
'other',
];

// import 'package:flutter/material.dart';

// final List<Category> categories =[
//  Category(name: 'Health' , icon: Icon(Icons.wifi,),
//  Category(name: 'Internet' , icon: Icons.wifi),
//  Category(name: 'Transportation' , icon: Icons.wifi),
//   Category(name: 'Transportation' , icon: Icons.wifi),
// ];


// 'Health',
// 'Internet',
// 'Transportation',
// 'Grocery',
// 'Savings',
// 'other',

class Category{
 final String? name;
 final Icon? icon;

  Category(this.name, this.icon);
 
}

