
import 'package:flutter/material.dart';
import 'package:jezreel_app/src/bloc/product_bloc.dart';
import 'package:jezreel_app/src/models/product.dart';
import 'package:jezreel_app/src/utils/colors.dart';
import 'package:jezreel_app/src/widgets/page_indicator.dart';
import 'package:provider/provider.dart';

class PhotoProduct extends StatefulWidget {
  @override
  _PhotoProductState createState() => _PhotoProductState();
}

class _PhotoProductState extends State<PhotoProduct> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
   
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductBloc>(context,listen:false);
    final size = MediaQuery.of(context).size;
    return Positioned.fill(
      top: kToolbarHeight,
      bottom: size.height * .50,
      child: ValueListenableBuilder<Product>(
        valueListenable: bloc.product,
        builder: (context, product,_) {
          return Container(
            color:hexToColor(product.background),
            width: size.width,
            child: Stack(
              children:<Widget>[
               
                Positioned.fill(
                   bottom: size.height * .1,
                    child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    itemCount: product.images.length,
                    itemBuilder: (_, i) =>
                        Hero(
                      tag: product.name,
                      child: FadeInImage(
                      placeholder: AssetImage('assets/images/placeholder.png'),
                      image: NetworkImage(product.images[i]),
                      fit : BoxFit.contain,
                      // height: responsive.ip(25),
                      ),
                    ),
                  ),
                ),

                Positioned(
              bottom: size.height * .07,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, i) => CustomPaint(
                  painter: PageIndicatorPainter(
                    pageCount: product.images.length,
                    dotFillColor: Theme.of(context).primaryColor,
                    indicatorColor: Theme.of(context).accentColor,
                    dotRadius: 5,
                    scrollPosition: (_controller.hasClients && _controller.page != null) ? _controller.page : 0.0,
                  ),
                ),
              ),
            )
              ]
            ),
          );
        }
      ),
    );
  }
}