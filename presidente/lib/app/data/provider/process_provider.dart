import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:presidente/app/data/model/process_model.dart';

const processCollection = 'processos';
const cityCollection = 'cidades';

class ProcessProvider {
  FirebaseFirestore firestore;

  ProcessProvider({@required this.firestore});

  Future<ProcessModel> getProcess(DocumentReference reference) =>
      reference.get().then((snapshot) => ProcessModel.fromSnapshot(snapshot));

  Future<Stream<List<ProcessModel>>> getStream() async {
    var cidade = _fetchCidade('cambuquira');
    var processos = await _fetchProcesses(cidade);
    var str = processos.snapshots();
    print((await processos.get()).docs.length);
    return str.map((query) =>
        query.docs.map((e) => ProcessModel.fromSnapshot(e)).toList());

    // var firstMap = str.map((querySnapshot) => querySnapshot.docs);
    // var secondMap = firstMap.map(
    //     (list) => list.map((snap) => ProcessModel.fromSnapshot(snap)).toList());
    // print(secondMap);
    // return str;
    // return str.map((querySnapshot) => querySnapshot.docs
    //     .map((snap) => ProcessModel.fromSnapshot(snap))
    //     .toList());

    // return processos.snapshots().map((querySnapshot) => querySnapshot.docs.map((documentSnapshot) => ProcessModel.fromSnapshot(documentSnapshot))));
  }

  Query _fetchCidade(cityName) =>
      firestore.collection(cityCollection).where('name', isEqualTo: cityName);

  Future<CollectionReference> _fetchProcesses(Query cidade) async =>
      (await cidade.get()).docs.first.reference.collection(processCollection);

  add(ProcessModel processModel) async {
    var cidade = _fetchCidade('cambuquira');
    var processos = await _fetchProcesses(cidade);
    processos.add(processModel.toMap());
    //TODO: Retornar a referencia e atualizar a lista
    //collection(processCollection).add(processModel.toMap())
  }
// Post request with File

}
