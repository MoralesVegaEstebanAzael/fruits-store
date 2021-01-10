import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:jezreel_app/src/bloc/home_bloc.dart';
import 'package:jezreel_app/src/widgets/badge_notification.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context,listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: bloc.show,
      builder: (context, value,_) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds:300),
          top:  value ? 0 : -kToolbarHeight * 2,
          left: 0,
          right: 0,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      Icon(Boxicons.bx_menu_alt_left),
                      BadgeNotification(notificationCount: 2)
                      // Icon(Boxicons.bx_shopping_bag),
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width:1,
                          color: Colors.grey[300]
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget>[
                            Text("Buscar",
                              style: Theme.of(context).accentTextTheme.subhead.copyWith(fontWeight:FontWeight.bold),
                            ),
                            Icon(Icons.search)
                          ]
                        ),
                      ),
                    ),
                    )
                ],
              ),
            ),
              ),
        );
      }
    );
  }
}