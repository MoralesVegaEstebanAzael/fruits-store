import 'package:flutter/cupertino.dart';
import 'package:jezreel_app/src/utils/container_dimensions.dart';

class ShoppingCartBloc extends ChangeNotifier{
  // ValueNotifier<double> _height = ValueNotifier(55);
  // ValueNotifier<double> get containerHeight => _height;
  // double _defaultHeight = 55.0;
  // ValueNotifier<double> _width = ValueNotifier(100);
  // ValueNotifier<double> get containerWidth => _width;

  ContainerDimensions containerDimensions = ContainerDimensions(height: 55,width: 500,change: false,offset: Offset(0,0));

  ValueNotifier<ContainerDimensions> _container = ValueNotifier(null);
  ValueNotifier<ContainerDimensions> get container => _container;

  ValueNotifier<Offset> _offset = ValueNotifier(null);
  ValueNotifier<Offset> get offset => _offset;


  ValueNotifier<int> _itemCount = ValueNotifier(0);
  ValueNotifier<int> get itemCount => _itemCount;


  ValueNotifier<double> _shoppingBagAnimation = ValueNotifier(0.8);
  ValueNotifier<double> get shoppingBagAnim => _shoppingBagAnimation;

  ValueNotifier<double> _favoriteAnimation = ValueNotifier(0.8);
  ValueNotifier<double> get favoriteAnimation => _favoriteAnimation;

 ValueNotifier<bool> _isFavorite = ValueNotifier(false);
  ValueNotifier<bool> get isFavorite => _isFavorite;


  int cItem=0;
  ShoppingCartBloc(){
    container.value = containerDimensions;
    _offset.value = Offset(0,0);
    _itemCount.value = cItem;
  }
  setDimensions(){
    if(container.value.height ==55){
      container.value = ContainerDimensions(height: 50,width: 50,change: true,offset: Offset(400,0));
    }else{
       container.value = containerDimensions;
    }
  }


  setOffset(Offset offset){
     _offset.value = offset;
  }

  setShoppingBagAnim(double d)=> _shoppingBagAnimation.value=d;
  setFavoriteAnim(double d)=> _favoriteAnimation.value=d;

  defaultDimensions(){
     container.value = containerDimensions;

      // _offset.value = Offset(0,0);
  }
  
  setItemCount(){
    cItem++;
    itemCount.value = cItem;
    setShoppingBagAnim(1.4);
  }

  addFavorite(){
    _isFavorite.value = !_isFavorite.value;
    setFavoriteAnim(1.4);
  }

}