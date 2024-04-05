import 'package:favorite/models/favorite_list_model.dart';
import 'package:favorite/models/favorite_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavoriteList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Favorite',
              style:Theme.of(context).textTheme.headline1,
            ),
             floating: true,
            actions: [
              IconButton(onPressed: () => Navigator.pushNamed(context,'/favoritepage'),
                  icon: const Icon(Icons.favorite_outlined),
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          SliverList(
              delegate:
            SliverChildBuilderDelegate(
                    (context, index) => _MyListItem(index),
           childCount:15 ,//دي اللي بتحدد عدد الحاجات اللي هتظهر في الصفحة
            ),
          ),
        ],
      ),
    );
  }
}

//
// class colomn extends StatelessWidget {
//   const colomn({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//       Icon(Icons.access_time_filled,size: 25),
//         CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               title: Text('Favorite',
//                 style:Theme.of(context).textTheme.headline1,
//               ),
//               floating: true,
//               actions: [
//                 IconButton(onPressed: () => Navigator.pushNamed(context,'/favoritepage'),
//                   icon: const Icon(Icons.favorite_outlined),
//                 )
//               ],
//             ),
//             const SliverToBoxAdapter(
//               child: SizedBox(height: 12),
//             ),
//             SliverList(
//               delegate:
//               SliverChildBuilderDelegate(
//                     (context, index) => _MyListItem(index),
//                 childCount:15 ,//دي اللي بتحدد عدد الحاجات اللي هتظهر في الصفحة
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }





//ui of Mylistitem widget
class _MyListItem extends StatelessWidget {
final int index;

  const _MyListItem(this.index,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   var item = context.select<FavoriteListModel, Item>(
       (favoritelist) => favoritelist.getByPosition(index),
   );
   var textTheme = Theme.of(context).textTheme.headline6;

   return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
         color: Colors.grey,
      ),
      child: Row(
        children: [
          // Icon(Icons.access_time_filled),
          AspectRatio(
            aspectRatio: 0.7,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 20,horizontal: 20),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40) ,
                  boxShadow: List.filled(20, BoxShadow()),
                  image: DecorationImage(image: AssetImage(item.image)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name , style: TextStyle(
                  color: item.color,
                  fontSize:  24,
                  fontWeight: FontWeight.w700,
                ),),
              SizedBox(height: 5,),
                Text("Sub title"),
                //  Text(item.subtitle, style: ,),
              ],
            ),
          ),

          _AddButton(item: item),
        ],
      ),
    ),
  );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item,Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //the context.select() method will let you listen to changes to a *part* of a model
    // you define a function that "selects" (i.e. returns) the part you're interested in
    //and the provider package will not rebuild this widget unless that particular part of the model changes
    //this can lead to significant performance imporovements
    var isInFavoritePage = context.select<FavoritePageModel,bool >(
      //Here we are only interested whether [item] is inside the favorite page
        (favoritepage) => favoritepage.items.contains(item),

    );

    return IconButton(
      icon: isInFavoritePage ?
      Icon(Icons.favorite,color:item.color ,)
          : Icon(Icons.favorite,),
      onPressed: isInFavoritePage ?
    () {
      var favoritepage = context.read<FavoritePageModel>();
      favoritepage.remove(item);
    }
    :() {
      var favoritepage = context.read<FavoritePageModel>();
      favoritepage.add(item);
    },

    );
  }
}



//Padding(
//      padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
//    child: Container(
// height: 150,
//      child: Row(
//        children: [
//          AspectRatio(
//            aspectRatio: 1,
//            child: Image.asset(item.image),
//          ),
//          const SizedBox(width: 15,),
//          Expanded(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Text(item.name , style: TextStyle(
//                  color: item.color,
//                  fontSize: 24,
//                  fontWeight: FontWeight.w700,
//                ),),
//                //هنا هنحط الsub title
//                //  Text(item.subtitle, style: ,),
//              ],
//            ),
//          ),
//          _AddButton(item: item),
//        ],
//      ),
//    ),
//    );