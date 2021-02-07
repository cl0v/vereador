import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:presidente/app/data/model/process_model.dart';
import 'package:presidente/app/data/provider/process_provider.dart';

class ProcessRepository {

final ProcessProvider provider;

ProcessRepository({@required this.provider}) : assert(provider != null);

Future<Stream<List<ProcessModel>>> getAll(){
  return provider.getStream();
}
// getId(id){
//   return provider.getId(id);
// }
// delete(id){
//   return provider.delete(id);
// }
// edit(obj){
//   return provider.edit( obj );
// }
add(ProcessModel processModel){
    return provider.add(processModel);
}

}