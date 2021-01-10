import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class BadgeNotification extends StatelessWidget {
  final int notificationCount;
  const BadgeNotification({
    Key key,@required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
           icon:Icon(Boxicons.bx_shopping_bag,color: Theme.of(context).iconTheme.color,),
          onPressed: null),
         Positioned(
          top: 10,
          right: notificationCount>9?0:5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:6, vertical: 2),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).accentColor),
            alignment: Alignment.center,
            child: Text('$notificationCount',style: Theme.of(context).primaryTextTheme.bodyText2.copyWith(fontSize:11),),
          ),
        )
        
      ],
    );
  }
}