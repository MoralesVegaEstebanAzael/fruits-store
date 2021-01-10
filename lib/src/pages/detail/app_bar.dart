
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:jezreel_app/src/bloc/product_bloc.dart';
import 'package:jezreel_app/src/bloc/shopping_cart_bloc.dart';
import 'package:jezreel_app/src/models/product.dart';
import 'package:jezreel_app/src/utils/colors.dart';
import 'package:jezreel_app/src/widgets/badge_notification.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of<ProductBloc>(context,listen:false);
    final sBloc  = Provider.of<ShoppingCartBloc>(context,listen:false);
    return Positioned(
      top: 0,
        child: ValueListenableBuilder<Product>(
          valueListenable: bloc.product,
          builder: (context, p,_) {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor:hexToColor(p.background),
              statusBarBrightness: Brightness.light,
            ));

            return Container(
            color:hexToColor(p.background),
            height: kToolbarHeight,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                IconButton(
                  onPressed: (){
                    
                    Navigator.pop(context);
                     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarBrightness: Brightness.light,
                    ));
                  },
                  icon:Icon(Boxicons.bx_chevron_left,color: Theme.of(context).iconTheme.color,)
                ),
                ValueListenableBuilder<int>(
                  valueListenable:sBloc.itemCount ,
                  builder: (context, v,_) {
                    return ValueListenableBuilder<double>(
                      valueListenable: sBloc.shoppingBagAnim,
                      builder: (context, anim,_) {
                        return TweenAnimationBuilder(
                          duration: Duration(seconds:1),
                          onEnd: (){
                            sBloc.setShoppingBagAnim(0.8);
                          },
                          tween:Tween<double>(
                            begin: 0.8,
                            end: anim
                          ) ,
                          // duration: ,
                          builder: (_,animation,__){
                            return Transform.scale(
                              scale: animation,
                              child:   BadgeNotification(notificationCount: v,),
                            );
                          },
                        );
                      }
                    );
                   
                  }
                )
              ]
            ),
      );
          }
        ),
    );
  }
}

