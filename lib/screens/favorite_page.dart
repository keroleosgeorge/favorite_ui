import 'package:favorite/models/favorite_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
//this gets the current  state of FavoritePageModel and also tells Flutter
  //to rebuild this widget when FavoritePageModel notifies liseteners in other words when it changes

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite page",
          style: Theme.of(context).textTheme.headline1,),

      ),
      body: Container(

        color: Colors.white,
        child: Column(

          children: [
            Icon(Icons.access_time_filled,size: 30,),
            Expanded(
                child: Padding(
                    padding:const EdgeInsets.all(8),
              //to call favoritePageList widget
                  child: _FavoritePageList(),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritePageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

 var itemNameStyle = Theme.of(context).textTheme.headline6;
 //this gets the current state of FavoritePageModel and also tells Flutter
 //to rebuild this widget when FavoritePageModel notifies listeners or when changes
 var favoritepage = context.watch<FavoritePageModel>();

 return ListView.builder(
shrinkWrap: true,
   padding: EdgeInsetsDirectional.all(5),
   itemCount: favoritepage.items.length,

   itemBuilder: (context , index) => ListTile(

     leading: Image.asset(
       favoritepage.items[index].image,
       height: 100,
     ),

     trailing: IconButton(
       //code to remove the favorite list
       onPressed: (){
         favoritepage.remove( favoritepage.items[index]);
       },
         icon: const Icon(Icons.delete),
     ),
     title: Text(
       favoritepage.items[index].name,
       style:itemNameStyle ,
     ),
shape: OutlineInputBorder(borderSide: BorderSide(width:10)),
     // here we can add sub title
    // subtitle: ,


   ),
 );


  }
}
