// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:food_delivery_app/components/common/food_card.dart';

// class SearchResults extends StatefulWidget {
//   @override
//   State<SearchResults> createState() => _SearchResultsState();
// }

// class _SearchResultsState extends State<SearchResults> {
//   final SearchController controller = SearchController();
//   final int itemCount = 2;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFEDEDED),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(80),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           elevation: 0,
//           backgroundColor: Color(0xFFEDEDED),
//           toolbarHeight: 100,
//           title: SearchBar(
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 IconData(0xee84,
//                     fontFamily: 'MaterialIcons', matchTextDirection: true),
//                 size: 18,
//               ),
//             ),
//             backgroundColor: MaterialStateProperty.all(Color(0xFFEDEDED)),
//             hintText: 'Search...',
//             hintStyle: MaterialStateProperty.all(TextStyle(
//               fontFamily: 'SF Pro',
//               fontWeight: FontWeight.w600,
//               fontSize: 17.0,
//               color: Colors.black,
//             )),
//             elevation: MaterialStateProperty.all(0),
//           ),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(top: 16),
//         decoration: BoxDecoration(
//             color: Color(0xFFF9F9F9),
//             borderRadius: BorderRadius.all(Radius.circular(30.0))),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 0,
//               child: Text(
//                 'Found 6 results',
//                 style: TextStyle(
//                   fontFamily: 'SF Pro',
//                   fontWeight: FontWeight.w700,
//                   fontSize: 34.0,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: StaggeredGridView.builder(
//                 gridDelegate:
//                     SliverStaggeredGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   staggeredTileBuilder: (int index) {
//                     // Use index to determine the tile configuration for each item
//                     // For example, give the first item more padding from the top
//                     return StaggeredTile.count(1, index == 1 ? 0.35 : 1.8);
//                   },
//                   mainAxisSpacing: 0.0, // Spacing between rows
//                   crossAxisSpacing: 0.0, // Spacing between columns
//                 ),
//                 itemCount: 20,
//                 itemBuilder: (BuildContext context, int index) {
//                   return index == 1
//                       ? Container()
//                       : Padding(
//                           padding:
//                               const EdgeInsets.only(left: 16.0, right: 16.0),
//                           child: GestureDetector(
//                               onTap: () =>
//                                   Navigator.pushNamed(context, '/foodInfo'),
//                               // child: FoodCard()),
//                               child: Text('result')),
//                         );
//                 },
//                 padding: EdgeInsets.only(top: 16),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
