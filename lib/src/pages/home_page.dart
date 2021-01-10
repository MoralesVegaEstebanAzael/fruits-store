import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jezreel_app/src/bloc/home_bloc.dart';
import 'package:jezreel_app/src/models/product.dart';
import 'package:jezreel_app/src/utils/colors.dart';
import 'package:jezreel_app/src/widgets/sliver_custom.dart';
import 'package:provider/provider.dart';

import 'fruits/fruits_category_page.dart';
import 'home/app_bar.dart';
import 'home/nav_category.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          // backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          body: SafeArea(
          child: Stack(
          children: <Widget>[
            MyAppBar(),
            Nav(),
            MyPageView() 
          ],
        ),
      ),
    );
  }
}

class MyPageView extends StatelessWidget {
  
  const MyPageView({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context,listen: false);

    return ValueListenableBuilder<bool>(
      valueListenable: bloc.show,
      builder: (context, value,_) {
        
        return Positioned.fill(
          top: value?170:kToolbarHeight,
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: bloc.pageController,
            children: <Widget>[
              FruitsCategoryPage(),
              Container(height:100,color: Colors.green,),
              Container(height:100,color: Colors.red,),
              Container(height:100,color: Colors.orange,),
              Container(height:100,color: Colors.blue,),
              Container(height:100,color: Colors.purple,)
            ]
          ),
        );
      }
    );
  }
}





