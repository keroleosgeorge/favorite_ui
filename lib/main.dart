import 'package:favorite/common/theme.dart';
import 'package:favorite/fav.dart';
import 'package:favorite/models/favorite_list_model.dart';
import 'package:favorite/models/favorite_page_model.dart';
import 'package:favorite/screens/favorite_list.dart';
import 'package:favorite/screens/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //using MultiProviding is convenient when providing multiple objects
    return MultiProvider(
        providers: [
          // in this sample app FavoriteListModel never changes so a simple provider is sufficient
          Provider(
              create: (context) => FavoriteListModel()
          ),
          //FavoritePageModel is implemented as a changeNotifier which calls for the use of ChangeNotifierProvider Moreover FavoritePageModel depends
          //on FavoriteListModel so a ProxyProvider is nedded
          ChangeNotifierProxyProvider<FavoriteListModel , FavoritePageModel>(
            create: (context) => FavoritePageModel(),
              update: (context ,favoritelist ,favoritepage  ) {
              if(favoritepage == null)
                throw ArgumentError.notNull('favoritepage');
              favoritepage.favoritelist = favoritelist;
              return favoritepage;
              } ,
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Provider',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          'test' : (context) => favoritee(),
          '/' : (context) => FavoriteList(),
          '/favoritepage' : (context) => FavoritePage(),
        },
      ),
    );
  }
}
