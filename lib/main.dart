import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jezreel_app/src/bloc/home_bloc.dart';
import 'package:jezreel_app/src/bloc/product_bloc.dart';
import 'package:jezreel_app/src/bloc/shopping_cart_bloc.dart';
import 'package:jezreel_app/src/pages/home_page.dart';
import 'package:jezreel_app/src/pages/detail/product_detail.dart';
import 'package:jezreel_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   // // systemNavigationBarColor: Colors.blue, // navigation bar color
  //   statusBarColor: Colors.white,
    
  //   // statusBarBrightness: Brightness.light
  //    // status bar color
  // ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeBloc()),
        ChangeNotifierProvider(create: (_) => ProductBloc.instance),
        ChangeNotifierProvider(create: (_) => ShoppingCartBloc(),)
      ],
        child: MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        // home: ProductDetail(),
        initialRoute: 'home',
        routes: {
          'home'        :           (BuildContext)=>HomePage(),
          'detail'      :           (BuildContext)=> ProductDetail()
        },//L
      ),
    );
  }
}
