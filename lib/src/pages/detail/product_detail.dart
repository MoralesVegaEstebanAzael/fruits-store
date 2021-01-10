import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:jezreel_app/src/bloc/product_bloc.dart';
import 'package:jezreel_app/src/bloc/shopping_cart_bloc.dart';
import 'package:jezreel_app/src/models/product.dart';
import 'package:jezreel_app/src/pages/detail/photo_product.dart';
import 'package:jezreel_app/src/utils/container_dimensions.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'app_bar.dart';
class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _pop(BuildContext context) {
      Navigator.pop(context);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:Colors.white,
        statusBarBrightness: Brightness.dark,
      ));
    }


    return ChangeNotifierProvider.value(
          value: ProductBloc.instance,
          child: WillPopScope(
            onWillPop: () {
              _pop(context);
            },
            child: SafeArea(
              child: Scaffold(
                body: Stack(
                  children:<Widget>[
                    DetailAppBar(),
                    PhotoProduct(),
                    InfoProduct()
                  ]
                ),
              ),
            ),
          ),
    );
  }
}

class InfoProduct extends StatelessWidget {
  const InfoProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * .40,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: Container(
          color:Theme.of(context).primaryColor,
          // color: Colors.red,
          child: Padding(
            padding: EdgeInsets.only(top:15, ),
            child: CustomScrollView(
            
              physics:NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                HeadDetail(),
                DescriptionDetail(), 

                SliverToBoxAdapter(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(vertical:25.0,horizontal: 0),
                    child: Column(
                      children:<Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(flex:1,
                                      child:GestureDetector(
                                        onTap: null,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(LineIcons.circle,size: 40,color: Theme.of(context).primaryColorDark,),
                                              Icon(LineIcons.minus,color: Theme.of(context).primaryColorDark,),
                                            ],
                                          ),
                                      ), 
                                    ),
                                    Expanded(flex:0,child: Text("01",style:TextStyle(fontSize:25))),
                                    Expanded(flex:1,
                                      child:GestureDetector(
                                        onTap: null,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Icon(LineIcons.circle,size: 40,color: Theme.of(context).primaryColorDark,),
                                              Icon(LineIcons.plus,)
                                            ],
                                          ),
                                      ), 
                                    ),
                                    Expanded(flex:1,child: Container()),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Text("\$${23.99}",style: Theme.of(context).textTheme.display1,))

                          ]
                        )
                      ]
                    ),
                  )
                ),

                AddDetail(),


               

              ],
            ),
            ),
        )));
  }
}

class AddDetail extends StatelessWidget {
  const AddDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sBloc = Provider.of<ShoppingCartBloc>(context,listen: false);
    // GlobalKey key = GlobalKey();
    return SliverToBoxAdapter(
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical:25.0,horizontal: 20),
        child:Row(
          children: [
            Expanded(flex:1,child: Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColorDark)
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child:IconButton(
                    onPressed:()=>sBloc.addFavorite(),
                    icon: AnimationFavorite())
                ),
              ),
            ),),
            const SizedBox(width: 10,),
            Expanded(
              flex:5,
              child: GestureDetector(
                onTap: (){
                  sBloc.setDimensions();
                  sBloc.setItemCount();
                },
                  child: Center(
                    child: Stack(
                      children: [
                        ValueListenableBuilder<ContainerDimensions>(
                          valueListenable: sBloc.container ,
                          builder: (context, value,_) {
                            return TweenAnimationBuilder(
                              curve: Curves.easeInBack,//easeInQuart,
                              onEnd: (){
                                sBloc.defaultDimensions();
                              },
                              tween: Tween<Offset>(
                                begin: Offset(0,0),
                                end:  value.offset,
                              ), 
                              duration: Duration(milliseconds:500), 
                              builder: (_,animation,__){
                                return Transform.translate(
                                  offset: animation,
                                  child:  AnimatedContainer(
                                      duration: Duration(milliseconds: 50),
                                      curve: Curves.fastOutSlowIn,
                                      key: key,
                                      height:value.height, //value!=null? value.height:55,
                                      width: value.width,//value!=null?value.width:double.infinity,
                                      decoration: BoxDecoration(
                                        color:Theme.of(context).accentColor,
                                        borderRadius:value.change?BorderRadius.circular(50): BorderRadius.circular(10)
                                      ),
                                      child:value.change?
                                        Container(
                                          child:Icon(LineIcons.shopping_cart,color: Theme.of(context).primaryColor,size: 30,))
                                        : Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Icon(LineIcons.smile_o,color: Theme.of(context).primaryColor,),
                                        const SizedBox(width: 10,),
                                        Flexible(
                                          child: Text("Agregar",
                                          style: Theme.of(context).textTheme.title.copyWith(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                                        )
                                      ],),
                                      )
                                );
                              } 
                            );
                          })
                      ],
                    ),
                  )
            ))
        ],)
      )
    );
  }
}

class AnimationFavorite extends StatelessWidget {
  const AnimationFavorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final sBloc = Provider.of<ShoppingCartBloc>(context,listen: false);
    return ValueListenableBuilder<double>(
      valueListenable: sBloc.favoriteAnimation,
      builder: (context, v,_) {
        return TweenAnimationBuilder(
            duration: Duration(seconds:1),
            onEnd: (){
              sBloc.setFavoriteAnim(0.8);
            },
            tween:Tween<double>(
              begin: 0.8,
              end: v
            ) ,
            // duration: ,
            builder: (_,animation,__){
              return Transform.scale(
                scale: animation,
                child:  ValueListenableBuilder<bool>(
                  valueListenable: sBloc.isFavorite,
                  builder: (context, isFavorite,_) {
                    return Icon(isFavorite?LineIcons.heart:LineIcons.heart_o,size: 30,color:Colors.red);
                  }
                ),
              );
            },
          );
          
      }
    );
  }
}

class HeadDetail extends StatelessWidget {
  const HeadDetail({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductBloc>(context,listen:false);
    final p = bloc.product.value;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top:25.0,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(bloc.product.value.name,style:Theme.of(context).textTheme.display1.copyWith(fontWeight:FontWeight.bold)),
            const SizedBox(height:15),
            Text("Por ${p.unit==UNIT.KG? 'kilo':'pieza'}",
            style: Theme.of(context).primaryTextTheme.headline.copyWith(color:Theme.of(context).accentColor),),
          ],
        ),
      )
    );
  }
}

class DescriptionDetail extends StatelessWidget {
  const DescriptionDetail({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductBloc>(context,listen:false);
    final p = bloc.product.value;
    return SliverToBoxAdapter(
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical:25.0,horizontal: 20),
        child: Container(
          child:Text("${p.description}",style: Theme.of(context).accentTextTheme.subhead,)
        ),
      )
    );
  }
}

