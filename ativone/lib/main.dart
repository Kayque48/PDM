import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: PaginaRandom()));
}

class PaginaRandom extends StatefulWidget {
  @override
  _PaginaRandomState createState() => _PaginaRandomState();
}

class _PaginaRandomState extends State<PaginaRandom> {
  int numb = 1;

  void randNumb() {
    setState(() {
      numb = Random().nextInt(10) + 1;
      if (Random().nextBool()) {
        numb = numb * -1;
      }
    });
  }

   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Sorteador de Números(1 a 10)"),
      backgroundColor: Colors.orange),
      body: Center(child: Text("Seu número da sorte: $numb",
      style: TextStyle(fontSize: 30, color: Colors.orange),
      )),
      floatingActionButton: FloatingActionButton(onPressed: randNumb, child: Icon(Icons.casino)),
    );
  }
}