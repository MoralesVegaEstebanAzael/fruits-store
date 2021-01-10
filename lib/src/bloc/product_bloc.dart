import 'package:flutter/cupertino.dart';
import 'package:jezreel_app/src/models/product.dart';

class ProductBloc extends ChangeNotifier{
  static ProductBloc instance = ProductBloc();
  ValueNotifier<Product> _product = ValueNotifier(null);
  ValueNotifier<Product> get product => _product;
  

  void setProduct(Product p)=>_product.value=p;
}