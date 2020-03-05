
class Entry  {
  static bool i=true;
    String id;
   double star;
   String date;
   String dis;
   String img;


  Entry(this.id,this.star, this.date, this.dis, this.img);

  Entry.fromMap(Map snapshot,String id) :
        id = id ?? '',
        star = snapshot['star'] ?? '',
        date = snapshot['date'] ?? '',
        dis = snapshot['dis'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "star": star,
      "date": date,
      "dis": dis,
      "img":img,
    };
  }




}