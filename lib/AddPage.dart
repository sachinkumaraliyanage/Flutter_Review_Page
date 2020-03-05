import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
import 'ReviewsPage.dart';
import 'FullBackground.dart';
import 'Entry.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:intl/intl.dart';
import 'CRUDModel.dart';

class AddPage extends StatefulWidget {
  @override
  _AddpageState createState() => _AddpageState();
}

class _AddpageState extends State<AddPage> {
  final _img = [
    'assets/img/a1.jpg',
    'assets/img/a2.jpg',
    'assets/img/a3.jpg',
    'assets/img/a4.jpg',
    'assets/img/a5.jpg',
    'assets/img/a6.jpg',
    'assets/img/a7.png',
    'assets/img/a8.png',
    'assets/img/a9.png',
    'assets/img/a10.png',
    'assets/img/a11.png',
  ];

  double rating = 0.0;
  String avatar = 'assets/img/a1.jpg';
  TextEditingController name = TextEditingController();
  TextEditingController rev = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new FullBackground('assets/img/back03.jpg', 3.0, 3.0, 0.2),
          new Center(
            child: new SingleChildScrollView(
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Avatar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    new SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: DropdownButton<String>(
                          iconSize: 30,
                         itemHeight: 100,
                          items : _img.map((String value

                              ){
                            return DropdownMenuItem<String>(
                                value :value,
                                child:new Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Image.asset(value),
                                )

                            );

                          }).toList(),
                          value:avatar,
                          onChanged:(String value) {
                            setState(() {
                              this.avatar=value;
                            });

                          }
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stars',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    new Center(
                      child: SmoothStarRating(
                          allowHalfRating: true,
                          onRatingChanged: (v) {
                            rating = v;
                            setState(() {});
                          },
                          starCount: 5,
                          rating: rating,
                          size: 40.0,
                          color: Colors.amber,
                          borderColor: Colors.black,
                          spacing: 0.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Review',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    new TextField(
                      controller: rev,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Your Review",
                          labelStyle: textStyle,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(20.0))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    new OutlineButton(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      onPressed: () async {
                        Entry.i=true;
                        var now = new DateTime.now();
                        await CRUDModel().addEntry(new Entry(null,rating,new DateFormat("dd MMMM yyyy").format(now),rev.text,avatar));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => new ReviewsPage()),
                        );
                      },
                      child: Text(
                        "Add Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      borderSide: BorderSide(color: Colors.white),
                      shape: StadiumBorder(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
