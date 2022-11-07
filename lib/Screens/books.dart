import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_york_e_books/Screens/book_details.dart';
import 'package:new_york_e_books/Screens/constants.dart';

class Books extends StatefulWidget {
  List books;

  Books({required this.books});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarTheme("The New York Times", true),
      body: ListView.builder(
        itemCount: widget.books.length,
        itemBuilder: (context, index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.1,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Colors.white
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.books[index]["display_name"],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rancho(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(widget.books[index]["books"].length, (num) => GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> BookDetails(bookData: widget.books[index]["books"][num])),
                      );
                      print(widget.books[index]["books"][num]);
                    },
                    child: Container(
                      constraints: BoxConstraints(
                        // maxHeight: MediaQuery.of(context).size.height * 0.55,
                        // maxWidth: MediaQuery.of(context).size.width,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.books[index]["books"][num]["title"],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rancho(
                                  color: Colors.white,
                                  fontSize: 15
                                ),
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width,
                                maxHeight: 450,
                              ),
                              color: Colors.brown,
                              child: Image(
                                image: NetworkImage(widget.books[index]["books"][num]["book_image"]),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                  ))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}