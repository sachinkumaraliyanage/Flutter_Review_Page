import 'package:IT17152938/Entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'Data.dart';
import 'CRUDModel.dart';
import 'CreateEntry.dart';

//sachin kumara Liyanage
//IT17152938

class ReviewsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_ReviewsPageStatus();

}

class _ReviewsPageStatus extends State<ReviewsPage> {

  void setupstetus() async{
    Data.allstar=0.0;
    Data.data=new List();
    await new CRUDModel().fetchEntrys().then((value){
      value.forEach((element) {
        Data.data.add(new CreateEntry(new Entry(element.id, element.star, element.date, element.dis, element.img)));
      });
    });
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    if(Entry.i){
      Entry.i=false;
      setupstetus();
    }
//    Data.data=new List();
//    Data.allstar=0.0;
//    Data.data.add(new Entry(5, 'asasas', 'asdxasxcsxcascxascxscxascacacsac', 'assets/img/a7.png'));
//    Data.data.add(new Entry(3.5, 'asasas', 'asdxasxcsxcascxascxscxascacacsac', 'assets/img/a7.png'));

    int k=Data.data.length;
    double avgStar=Data.allstar/k;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Reviews",style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            new Align(
              alignment: Alignment.centerLeft,
              child: new Text("Reviews",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
            ),
            new Container(height: 10,),
            new Row(
              children: <Widget>[
                new SmoothStarRating(
                    allowHalfRating: false,
                    starCount: 5,
                    rating: avgStar,
                    size: 30.0,
                    color: Colors.amber,
                    borderColor: Colors.black,
                    spacing: 0.0
                ),
                new Text('  $k Reviews',style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold),),
              ],
            ),
            new Divider(
              height: 30,
              thickness: 2.0,
            ),
            new Expanded(
                child:BodyLayout(),
            )
          ],
        ),
      );
  }


}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {

    return ListView.separated(
      itemCount: Data.data.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 3.0,

      ),
      itemBuilder: (context, index) {
        return Container(
          child: Data.data[index],
        );
      },
    );
  }

}














