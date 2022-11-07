import 'package:flutter/material.dart';
import 'package:new_york_e_books/Screens/books.dart';
import 'package:new_york_e_books/Services/books_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List books = [];

  Future getAllBooks() async {
    List data = await getBooks();

    setState(() {
      books = data;
    });

    Future.delayed(Duration(seconds: 3), (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> Books(books: books)),
      );
    });
  }

  @override

  void initState(){
    getAllBooks();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}