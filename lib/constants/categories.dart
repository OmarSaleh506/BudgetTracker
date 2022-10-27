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
 Category(name: 'Health' , icon: Icon(Icons.wifi,)),
  Category(name: 'Internet' , icon: Icon(Icons.wifi,)),
 Category(name: 'Transportation' , icon: Icon(Icons.wifi,)),
 Category(name: 'Grocery' , icon: Icon(Icons.wifi,)),
 Category(name: 'Savings' , icon: Icon(Icons.wifi,)),
  Category(name: 'other' , icon: Icon(Icons.wifi,)),

];


class Category{
 final String? name;
 final Icon? icon;

  Category({ this.name, this.icon});
 
}

