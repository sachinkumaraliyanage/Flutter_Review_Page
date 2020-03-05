import 'Entry.dart';
import 'package:flutter/material.dart';
import 'FirebaseData.dart';
import 'locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
  FirebaseDataApi _api = locator<FirebaseDataApi>();

  List<Entry> products;


  Future<List<Entry>> fetchEntrys() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Entry.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchEntrysAsStream() {
    return _api.streamDataCollection();
  }

  Future<Entry> getEntryById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Entry.fromMap(doc.data, doc.documentID) ;
  }


  Future removeEntry(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateEntry(Entry data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addEntry(Entry data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}