import 'package:flutter/material.dart';
import 'package:lastupdateinshop/models/product.dart';
import 'package:lastupdateinshop/views/End_Screen.dart';
import 'package:lastupdateinshop/views/Order_Screen.dart';
import 'package:lastupdateinshop/views/SignUp.dart';
import 'package:lastupdateinshop/views/cart_screen.dart';
import 'package:lastupdateinshop/views/details_screen.dart';
import 'package:lastupdateinshop/views/home_screen.dart';
import 'package:lastupdateinshop/views/login_screen.dart';
import 'package:lastupdateinshop/views/not_found.dart';
import 'package:lastupdateinshop/views/splash_screen.dart';

import '../views/StateFulWidget.dart';

class AppRoutes{
  static Route<dynamic>? routeManager(RouteSettings settings ){

    switch(settings.name){
      case '/home': return MaterialPageRoute(builder: (ctx)=>HomeScreen());
      case '/details':{
        Product product= settings.arguments as Product;
        return MaterialPageRoute(builder: (ctx)=>DetailsScreen(p :product),settings: settings);}
      case '/cart':{
        List<Map<Product,int>> cartItems=settings.arguments as List<Map<Product,int>>;
        return MaterialPageRoute(builder: (ctx)=>CartScreen(cart: cartItems));}
      case '/splash': return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      case '/login': return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      case '/state' : return MaterialPageRoute(builder: (ctx)=>DemoStateFulWidget());
      case '/signup' : return MaterialPageRoute(builder: (ctx)=>SignUp());
      case '/order' : return MaterialPageRoute(builder: (ctx)=>OrderScreen());
      case '/end' : return MaterialPageRoute(builder: (ctx)=>EndScreen());
      default:return MaterialPageRoute(builder: (ctx)=>NotFoundScreen());
    }


  }
}