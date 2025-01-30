
//Importacion de las paginas
import 'package:crud_firebase/pages/add_clientes_pages.dart';
import 'package:crud_firebase/pages/edit_clientes_page.dart';
import 'package:crud_firebase/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Firebase',
      routes: {
        '/': (contexto) => Home(),
        '/add': (contexto) => AddClientesPage(),
        '/edit': (contexto) => EditClientesPage(),


      },
    );
  }
}




//flutter clean
//flutter pub get