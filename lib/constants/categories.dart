import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


final List<Category> categories =[
Category(name: 'صحه' , icon: SvgPicture.asset("lib/constants/icons/health.svg", color: Colors.black,
        fit: BoxFit.fill,)),
Category(name: 'اتصالات' , icon: SvgPicture.asset("lib/constants/icons/internet.svg",height: 24,)),
Category(name: 'نقل' , icon: SvgPicture.asset("lib/constants/icons/transportation.svg",height: 24,)),
Category(name: 'مقاضي' , icon: SvgPicture.asset("lib/constants/icons/grocery.svg",height: 24,)),
Category(name: 'سكن' , icon: SvgPicture.asset("lib/constants/icons/house.svg",height: 24,)),
Category(name: 'تعليم' , icon: SvgPicture.asset("lib/constants/icons/GraduationCap.svg",height: 24,)),
Category(name: 'سفر' , icon: SvgPicture.asset("lib/constants/icons/Airplane.svg", height: 24, )),
Category(name: 'عائلة' , icon: SvgPicture.asset("lib/constants/icons/family.svg",height: 24,)),
Category(name: 'مقاهي' , icon: SvgPicture.asset("lib/constants/icons/cafe.svg",height: 24,)),
Category(name: 'اخرى' , icon: SvgPicture.asset("lib/constants/icons/other.svg",height: 24,)),
Category(name: 'حوالات' , icon: SvgPicture.asset("lib/constants/icons/moneytransform.svg",height: 24,)),
Category(name: 'مطاعم' , icon: SvgPicture.asset("lib/constants/icons/restaurant.svg",height: 24,)),
];


class Category{
 final String? name;
 final Image? icon;
  Color? color;

  Category({ this.name, this.icon, this.color});
 
}

