import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProcessModel {
  final String title;
  final String subtitle;
  final int vereadorLack;
  //enum
  final Status status;
  //enum
  final Category category;
  final DocumentReference reference;

  ProcessModel({
    this.title,
    this.subtitle,
    this.vereadorLack,
    this.status,
    this.category,
    this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'vereadorLack': vereadorLack,
      'status': status?.index,
      'category': category?.index,
    };
  }

  factory ProcessModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProcessModel(
      title: map['title'],
      subtitle: map['subtitle'],
      vereadorLack: map['vereadorLack'],
      status: Status.values[map['status']],
      category: Category.values[map['category']],
    );
  }

  factory ProcessModel.fromSnapshot(DocumentSnapshot snapshot) =>
      ProcessModel.fromMap(snapshot.data())
          .copyWith(reference: snapshot.reference);

  String toJson() => json.encode(toMap());

  factory ProcessModel.fromJson(String source) =>
      ProcessModel.fromMap(json.decode(source));

  ProcessModel copyWith({
    String title,
    String subtitle,
    int vereadorLack,
    Status status,
    Category category,
    DocumentReference reference,
  }) {
    return ProcessModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      vereadorLack: vereadorLack ?? this.vereadorLack,
      status: status ?? this.status,
      category: category ?? this.category,
      reference: reference ?? this.reference,
    );
  }
}

enum Status {
  open,
  inProgress,
  closed,
}
enum Category {
  saude,
  esporte,
  educacao,
}
