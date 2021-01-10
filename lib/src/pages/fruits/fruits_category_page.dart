import 'package:flutter/material.dart';
import 'package:jezreel_app/src/bloc/home_bloc.dart';
import 'package:jezreel_app/src/bloc/product_bloc.dart';
import 'package:jezreel_app/src/models/product.dart';
import 'package:jezreel_app/src/pages/home/item_product.dart';
import 'package:jezreel_app/src/utils/colors.dart';
import 'package:provider/provider.dart';
class FruitsCategoryPage extends StatelessWidget {
  const FruitsCategoryPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context,listen:false);
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8),
      child: Container(
        child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            controller: bloc.controller,
            slivers: [
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ItemProduct(product: fruitsList[index],);
                    },
                    childCount: fruitsList.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child:Container(height: 50,)
                )
            ],
          ),
      ),
    );
  }
}


