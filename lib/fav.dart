import 'package:flutter/material.dart';

class favoritee extends StatelessWidget {
  const favoritee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
title: Text("favorite app"),
actions: [
  IconButton(onPressed: (){
    Navigator.pushNamed(context, '/');
  }, icon: Icon(Icons.favorite_border)),
],
),
      body: ListView(

        children: [
          Rowcus("assets/etadori.jpg","etadori"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-36-52.jpg","lofy"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-37-01.jpg","gon"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-37-15.jpg","ozumaki narotu"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-37-19.jpg","rengoku"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-37-20.jpg","uchiha itachi"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-37-24.jpg","rorono zoro"),
          SizedBox(height: 10),
          Rowcus("assets/photo_2023-10-03_15-40-34.jpg","lefay akraman"),
        ],
      ),
    );
  }
  Widget Rowcus(String image,String name){
return Row(
  children: [
Image.asset(image,height: 100,width: 100),
    Text(name),
    Spacer(flex: 1,),
    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
  ],
);
  }
}

