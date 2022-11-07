import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_york_e_books/Screens/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetails extends StatefulWidget {
  Map bookData;

  BookDetails({
    required this.bookData,
  });

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {

  void _launchUrl(String url) async {
    try{
      await launchUrl(Uri.parse(url));
    } catch(e){
      Fluttertoast.showToast(msg: "$e", backgroundColor: Colors.grey, textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarTheme(widget.bookData["title"], false),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "ABOUT",
                style: GoogleFonts.rancho(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 200,
                minHeight: 200,
                minWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                )
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      constraints: BoxConstraints(
                      maxHeight: 200,
                      minHeight: 200,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: descTextTheme("Author", widget.bookData["author"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: descTextTheme("Contributor", widget.bookData["contributor"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: descTextTheme("ISBN no", widget.bookData["primary_isbn13"]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              child: GestureDetector(
                                onTap: (){
                                  _launchUrl(widget.bookData["amazon_product_url"]);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.orange,
                                      size: 23,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Shop now",
                                      style: GoogleFonts.rancho(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 1.2,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      constraints: BoxConstraints(
                      maxHeight: 200,
                      minHeight: 200,
                      minWidth: MediaQuery.of(context).size.width * 0.32,
                    ),
                    child: Image(
                      image: NetworkImage(widget.bookData["book_image"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Description",
                  style: GoogleFonts.rancho(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: Text(
                    widget.bookData["description"],
                    style: GoogleFonts.rancho(
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}