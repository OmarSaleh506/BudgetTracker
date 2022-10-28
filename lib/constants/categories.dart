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
Category(name: 'Health' , icon: Icon(Icons.local_pharmacy)),
Category(name: 'Internet' , icon: Icon(Icons.wifi)),
Category(name: 'Transportation' , icon: Icon(Icons.directions_car)),
Category(name: 'Grocery' , icon: Icon(Icons.local_grocery_store)),
// Category(name: 'Savings' , icon: Icon(Icons.wifi)),
Category(name: 'other' , icon: Icon(Icons.add)),
];


class Category{
 final String? name;
 final Icon? icon;

  Category({ this.name, this.icon});
 
}

