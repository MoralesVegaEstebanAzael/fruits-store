import 'package:flutter/material.dart';
import 'package:jezreel_app/src/bloc/product_bloc.dart';
import 'package:jezreel_app/src/models/product.dart';
import 'package:jezreel_app/src/utils/colors.dart';
import 'package:provider/provider.dart';



class ItemProduct extends StatelessWidget {
  const ItemProduct({
    Key key, this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductBloc>(context,listen: false);
    return GestureDetector(
      onTap: (){
        bloc.setProduct(product);
        Navigator.pushNamed(context, 'detail');
      },
          child: Padding(
        padding: const EdgeInsets.only(left:10,right: 10,top: 10),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hexToColor(product.background),
            borderRadius:BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AspectRatio(aspectRatio: 16/12,
                  child: Hero(
                    tag: product.name,
                    child: FadeInImage(
                    placeholder: AssetImage('assets/images/placeholder.png'),
                    image: NetworkImage(product.images[0]),
                    fit : BoxFit.cover,
                    // height: responsive.ip(25),
                    ),
                  ),

                ),

                Text(product.name,
                  style: Theme.of(context).primaryTextTheme.headline.copyWith(fontWeight:FontWeight.bold),
                ),
                Text(product.description,
                  style: Theme.of(context).accentTextTheme.subhead,
                ),

                Column(
                  children: <Widget>[
                    Text("\$${product.price}",
                      style: Theme.of(context).primaryTextTheme.headline.copyWith(fontWeight:FontWeight.bold),
                    ),
                    Text("Por ${product.unit==UNIT.KG? 'KILO':'PIEZA'}"),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}