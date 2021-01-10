import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class HomeBloc extends ChangeNotifier{

  ValueNotifier<int> _index = ValueNotifier(0);
  ValueNotifier<int> get index => _index;

  ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;

  ScrollController _categoryController = ScrollController();
  ScrollController get categoryController => _categoryController;

  PageController _pageController= PageController(initialPage: 0);
  ScrollController get pageController => _pageController;

  ValueNotifier<bool> _show = ValueNotifier(true);
  ValueNotifier<bool> get show => _show;

  HomeBloc(){
    _init();
  }

  _init(){
    _controller.addListener(_listener);
    _pageController.addListener(_pageListener);
  }

  void _listener(){
    if(_controller.position.userScrollDirection==ScrollDirection.reverse &&
      _show.value){
        _show.value = false;
    }else if(_controller.position.userScrollDirection==ScrollDirection.forward && !_show.value){
      _show.value = true;
    }
  }

  void _pageListener(){
    _pageController.addListener(() {
       setPage(_pageController.page.round());
    });
  }

  
  double animate = 40;
  void setIndex(int index)async{
    if(_index.value<index){
      await _categoryController.animateTo(  
         _categoryController.position.pixels+50, duration: Duration(milliseconds: 5), curve: Curves.fastOutSlowIn);
    }else if(_index.value>index){
        await _categoryController.animateTo(  
        _categoryController.position.pixels-50, duration: Duration(milliseconds: 5), curve: Curves.fastOutSlowIn);
    }
    _index.value=index;
    await _pageController.animateToPage(_index.value, duration:Duration(milliseconds: 5), curve: Curves.easeInToLinear);
  }

  void setPage(int index)async{
    //  await _pageController.animateToPage(index, duration:Duration(milliseconds: 5), curve: Curves.fastOutSlowIn);
    if(_index.value<index){
      await _categoryController.animateTo(  
         _categoryController.position.pixels+50, duration: Duration(milliseconds: 5), curve: Curves.fastOutSlowIn);
    }else if(_index.value>index){
        await _categoryController.animateTo(  
        _categoryController.position.pixels-50, duration: Duration(milliseconds: 5), curve: Curves.fastOutSlowIn);
    }
    _index.value=index;
    // await _pageController.animateToPage(_index.value, duration:Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
  }

  // void pageChanged(int index)async{
  //   print("indexxxx $index");
  //   setIndex(index);
  // }
}