import 'package:flutter/material.dart';
import 'package:lista_de_compras/lista_de_compras.dart';

class ListaDeComprasApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.green)),
      home: ListaDeCompras(),
    );
  }
}

