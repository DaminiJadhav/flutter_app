// import 'package:flutter/material.dart';
// import 'package:flutter_app/model/ShopModel.dart';
//
// class ShopCard extends StatelessWidget {
//   final ShopModel model;
//   final int index;
//   final Function(double val) onHeight;
//
//   const ShopCard({Key key, this.model, this.index, this.onHeight})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       onHeight((context.size.height) / (model.products.length / 4));
//     });
//     return Column(
//       children: [
//         Divider(),
//         Text("${model.categoryName} $index"),
//         Card(
//           child: buildGridViewProducts(index, model.products),
//         ),
//       ],
//     );
//   }
//
//   GridView buildGridViewProducts(int index, List<Product> products) {
//     return GridView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: products.length,
//       gridDelegate:
//       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ShopHelper.GRID_COLUMN_VALUE),
//       itemBuilder: (context, index) {
//         return Card(
//           child: Text(products[index].name),
//         );
//       },
//     );
//   }
//
//
// //
// }