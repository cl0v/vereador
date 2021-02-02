import 'package:cloud_firestore/cloud_firestore.dart';

class VereadorModel {
  
  final String name;
  final bool isPresident;
  final DocumentReference reference;

  VereadorModel({
    this.name,
    this.isPresident,
    this.reference,
  });
}
