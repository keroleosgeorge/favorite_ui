import 'dart:ui';

import 'package:flutter/material.dart';

class FavoriteListModel{

  static List<String> itemname=[
    'etadori jujitsu kaisen',
    'lofy',
    'gon',
    'ozumaki naruto',
    'rengoku',
    'uchiha itachi',
    'rorono zoro',
    'lefay akraman',
  ];

  static List<String>itemimage=[
  ("assets/etadori.jpg"),
    ("assets/photo_2023-10-03_15-36-52.jpg"),
    ("assets/photo_2023-10-03_15-37-01.jpg"),
    ("assets/photo_2023-10-03_15-37-15.jpg"),
    ("assets/photo_2023-10-03_15-37-19.jpg"),
    ("assets/photo_2023-10-03_15-37-20.jpg"),
    ("assets/photo_2023-10-03_15-37-24.jpg"),
    ("assets/photo_2023-10-03_15-40-34.jpg"),
  ];

  static List<Color>itemcolor=[
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.green,
    Colors.orange,
    Colors.red,
   Colors.black87,
   Colors.greenAccent,
    Colors.lightGreenAccent,
  ];


  Item getById(int id)=>Item(
id,
itemname[id % itemname.length],
   itemimage[id % itemimage.length],
      itemcolor[id % itemcolor.length],
 );

 Item getByPosition(int position){

   //int this simplified case an item's position in the List is also its id

   return getById(position);
 }

}

class Item{
final int id;
final String name;
final String image;
final Color color;

const Item(
    this.id,
    this.name,
    this.image,
    this.color,
    );
@override
int get hashCode =>id;

@override
  bool operator == (Object other) => other is Item && other.id == id;
}