// import 'package:flutter/material.dart';
// import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
// import 'package:flutter_slidable_panel/widgets/slidable_panel.dart';

// import '../common/swipeToDelete.dart';

// class SlidableListTile extends StatelessWidget {
//   SlidableListTile(this.child);
//   final Widget child;
//   final SlideController _slideController = SlideController();

//   final ActionController _actionController = ActionController();

//   @override
//   Widget build(BuildContext context) {
//     return SlidablePanel(
//       controller: _slideController,
//       maxSlideThreshold: 0.40,
//       axis: Axis.horizontal,
//       postActionPanel: SlideActionPanel(
//         actionLayout: ActionLayout.spaceEvenly(ActionMotion.scroll),
//         slidePercent: _slideController.slidePercent,

//         /// bind [ActionController] with the [SlideActionPanel]
//         controller: _actionController,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.favorite_border),
//             style: ButtonStyle(
//               fixedSize: MaterialStatePropertyAll(Size(40, 40)),
//               shape: MaterialStatePropertyAll(CircleBorder()),
//               backgroundColor: MaterialStatePropertyAll(Color(0xFFDF2C2C)),
//               iconColor: MaterialStatePropertyAll(Colors.white),
//             ),
//           ),
//           SizedBox(width: 10),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.favorite_border),
//             style: ButtonStyle(
//               fixedSize: MaterialStatePropertyAll(Size(40, 40)),
//               shape: MaterialStatePropertyAll(CircleBorder()),
//               backgroundColor: MaterialStatePropertyAll(Color(0xFFDF2C2C)),
//               iconColor: MaterialStatePropertyAll(Colors.white),
//             ),
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       child: GestureDetector(
//         onTap: () {
//           _slideController.dismiss(
//             onDismissed: () {
//               _actionController.reset();
//             },
//           );
//         },
//         child: child,
//       ),
//     );
//   }
// }
