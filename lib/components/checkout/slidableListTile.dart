import 'package:flutter/material.dart';
import 'package:flutter_slidable_panel/controllers/action_controller.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';

class SlidableListTile extends StatelessWidget {
  SlidableListTile(
      {required this.child,
      required this.onDelete,
      required this.onFavouritePress});
  final Widget child;
  final onFavouritePress, onDelete;

  final ActionController _actionController = ActionController();
  final SlideController _slideController = SlideController(
    usePreActionController: true,
    usePostActionController: true,
  );

  // @override
  // void dispose() {
  //   _slideController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SlidablePanel(
      controller: _slideController,
      maxSlideThreshold: 0.40,
      axis: Axis.horizontal,
      postActions: [
        IconButton(
          onPressed: () async {
            await onFavouritePress!();
            _slideController.dismiss();
          },
          icon: Icon(Icons.favorite_border),
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(40, 40)),
            shape: MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(Color(0xFFDF2C2C)),
            iconColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () async {
            await onDelete();
            _slideController.dismiss();
            
          },
          icon: Icon(Icons.remove),
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(40, 40)),
            shape: MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(Color(0xFFDF2C2C)),
            iconColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
        SizedBox(width: 10),
      ],
      child: GestureDetector(
        onTap: () {
          _slideController.dismiss(
            onDismissed: () {
              _actionController.reset();
            },
          );
        },
        child: child,
      ),
    );
  }
}
