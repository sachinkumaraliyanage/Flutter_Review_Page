
import 'package:cloud_firestore/cloud_firestore.dart';


//sachin kumara Liyanage
//IT17152938

class FirebaseDataApi{


  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  FirebaseDataApi( this.path ) {
    if(ref!=null){
      ref=null;
    }
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }


}

