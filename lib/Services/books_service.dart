import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_york_e_books/Services/urls.dart';

Future<List> getBooks() async {
  List books = [];

  final response = await http.get(
    Uri.parse(booksURL),
    headers: {
      "Accept": "application/json",
    }
  );

  print(response.statusCode);

  switch(response.statusCode){
    case 200:
      books = jsonDecode(response.body)["results"]["lists"];
      break;
    
    default:
      books = [];
      break;
  }

  return books;
}