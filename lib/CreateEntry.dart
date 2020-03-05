import 'package:flutter/material.dart';
import 'Entry.dart';
import 'Data.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CreateEntry extends StatelessWidget{
  Entry e;

  CreateEntry(this.e){
    Data.allstar+=e.star;
  }

  @override
  Widget build(BuildContext context) {
    String date=e.date;
    return new Container(
      height: 75,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          new Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage(e.img),
                  ))),
          new Container(width: 20,),

          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new SmoothStarRating(
                        allowHalfRating: false,
                        starCount: 5,
                        rating: e.star,
                        size: 30.0,
                        color: Colors.amber,
                        borderColor: Colors.black,
                        spacing: 0.0
                    ),
                    new Text('  $date', style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.bold),),
                  ],
                ),
                new Expanded(
                  child: new Text(
                    e.dis, style: TextStyle(color: Colors.black38),),
                ),
              ],
            ),
          ),
        ],
      ),
//      ],
    );
  }
}