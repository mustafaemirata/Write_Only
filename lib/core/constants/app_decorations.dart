import 'package:flutter/material.dart';

class AppDecorations {
  
  static const BoxDecoration coffeeBackground = BoxDecoration(
   
    image: DecorationImage(
      image: AssetImage('assets/images/coffe.png',
      ),
      
      fit: BoxFit.cover,
    ),
  );
}
