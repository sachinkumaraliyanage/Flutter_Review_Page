import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'Data.dart';
class Entry extends StatelessWidget {
  final double star;
  final String date;
  final String dis;
  final String img;


  Entry(this.star, this.date, this.dis, this.img){
    Data.allstar+=star;
  }

  @override
  Widget build(BuildContext context) {
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
                    image: new AssetImage(img),
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
                        rating: star,
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
                    dis, style: TextStyle(color: Colors.black38),),
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