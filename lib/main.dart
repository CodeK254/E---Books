import 'package:flutter/material.dart';
import 'package:new_york_e_books/Screens/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=> const Loading(), 
      }
    )
  );
}