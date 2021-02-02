import 'package:cloud_firestore/cloud_firestore.dart';

class CityModel {
  final String name;
  final String state;
  final DocumentReference reference;

  CityModel({
    this.name,
    this.state,
    this.reference,
  });
}
