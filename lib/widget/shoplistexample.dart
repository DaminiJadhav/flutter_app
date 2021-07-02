// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_app/model/ShopModel.dart';
// import 'package:provider/provider.dart';
//
// class shoplistexample extends StatefulWidget {
//   @override
//   _shoplistexampleState createState() => _shoplistexampleState();
// }
//
// class _shoplistexampleState extends State<shoplistexample> {
//
//   ScrollController scrollController=new ScrollController();
//   ScrollController headerScrollController=new ScrollController();
//
//   List<ShopModel> shoplist;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     shoplist=List.generate(10, (index) => ShopModel(
//       categoryName: "Hello",
//       products: List.generate(6, (index) => Product(
//           "Product $index", index*100))
//     ));
//
//     scrollController.addListener(() {
//       final index = shoplist
//           .indexWhere((element) => element.position >= scrollController.offset);
//       tabBarNotifier.changeIndex(index);
//
//       headerScrollController.animateTo(
//           index * (MediaQuery.of(context).size.width * 0.2),
//           duration: Duration(seconds: 1),
//           curve: Curves.decelerate);
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("LIST VIEW"),
//       ),
//       body:_list()
//     );
//   }
//
//
//
//
//   Widget get buildListViewHeader {
//     return Consumer<TabBar>(
//       builder: (context, value, child) => ListView.builder(
//         itemCount: shoplist.length,
//         controller: headerScrollController,
//         padding: EdgeInsets.all(10),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) => buildPaddingHeaderCard(index),
//       ),
//     );
//   }
//
//   Padding buildPaddingHeaderCard(int index) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5),
//       child: RaisedButton(
//         color: Colors.red,
//         // color: tabBarNotifier.index == index ? Colors.red : Colors.blue,
//         onPressed: () => headerListChangePosition(index),
//         child: Text("${shoplist[index].categoryName} $index"),
//         shape: StadiumBorder(),
//       ),
//     );
//   }
//   ListView get buildListViewShop {
//     return ListView.builder(
//       controller: scrollController,
//       itemCount: shopListAndSpaceAreaLength,
//       itemBuilder: (context, index) {
//         if (index == shopListLastIndex)
//           return emptyWidget;
//         else
//           return ShopCard(
//             model: shopList[index],
//             index: index,
//             onHeight: (val) {
//               fillListPositionValues(val);
//             },
//           );
//       },
//     );
//   }
//
//   int get shopListAndSpaceAreaLength => shopList.length + 1;
//
//   int get shopListLastIndex => shopList.length;
//
//
//
//   _list(){
//     return  ListView.builder(
//         shrinkWrap: true,
//         controller: scrollController,
//         itemBuilder: (context,index){
//           print("$index-${scrollController.offset}");
//           return Card(
//             child: ListTile(
//               leading: CircleAvatar(child: Text(index.toString()),),
//               title: Placeholder(fallbackHeight: 100),
//               subtitle: Text("Hello $index"),
//             ),
//           );
//         }
//     );
//   }
//
//
//   double oneItemHeight = 0;
//
//   void fillListPositionValues(double val) {
//     if (oneItemHeight == 0) {
//       oneItemHeight = val;
//       shoplist.asMap().forEach((key, value) {
//         if (key == 0) {
//           shoplist[key].position = 0;
//         } else {
//           shoplist[key].position = getShopListPosition(val, key);
//         }
//       });
//     }
//   }
//
//   double getShopListPosition(double val, int index) =>
//       val * (shoplist[index].products.length / ShopHelper.GRID_COLUMN_VALUE) +
//           shoplist[index - 1].position;
// }
