import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore bd = FirebaseFirestore.instance;


Future<List>getClientes() async{
List clientes = [];

CollectionReference collectionReferenceClientes = bd.collection('clientes');


QuerySnapshot queryClientes = await collectionReferenceClientes.get();

for (var doc in queryClientes.docs){
  final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  final person = {
    "nombre": data['nombre'],
    "edad": data['edad'],
    "telefono": data['telefono'],
    "uid": doc.id,
  };
  clientes.add(person);
}
return clientes;
}


//guardar datos de un cliente en la base de datos
Future<void> addClientes(String name, String edad, String telefono) async{

await bd.collection('clientes').add({"nombre": name,"edad":edad, "telefono":telefono});

}


//actualizar datos de un cliente en la base de datos
Future<void> updateClientes(String uid, String newName, String newEdad, String newTelefono) async{
await bd.collection('clientes').doc(uid).set({"nombre":newName, "edad": newEdad, "telefono": newTelefono});

}

//Eliminar datos de un cliente en la base de datos

Future<void> deleteClientes(String uid)async{
await bd.collection('clientes').doc(uid).delete();
}
