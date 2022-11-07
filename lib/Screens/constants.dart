import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBarTheme(String text, bool homepage){
  return AppBar(
    toolbarHeight: 65,
    backgroundColor: Colors.black,
    elevation: 1,
    shadowColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 28,
    ),
    leading: const Icon(Icons.menu),
    title: Text(
      text,
      style: GoogleFonts.rancho(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: Colors.white,
      ),
    ),
    actions: [
      Row(
        children: [
          homepage == true ? Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: (){

              },
              child: const Icon(Icons.search),
            ),
          ) : Container(),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.newspaper),
          ),
        ],
      ),
    ],
  );
}

//------------------------Book Details Page------------------------------
Text descTextTheme(String text, String value){
  return Text(
    "$text: $value",
    style: GoogleFonts.rancho(
      fontSize: 15,
      color: Colors.white,
      letterSpacing: 1.2
    ),
  );
}