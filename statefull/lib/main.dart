import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PaginaContador()));
}


// 
class PaginaContador extends StatefulWidget {
  @override
  _PaginaContadorState createState() => _PaginaContadorState();
}


class _PaginaContadorState extends State<PaginaContador> {
  int contador = 927;

  void increment() {
    setState(() {
      contador++;
    });
  }

  void antincrement() {
    setState(() {
      contador--;
    });
  }

  void reset() {
    setState(() {
      contador = 927;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Meu App Interativo"),
      backgroundColor: Colors.orange),
      body: Center(child: Text("Cliques: $contador",
      style: TextStyle(fontSize: 30, color: Colors.orange), 
      )
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(onPressed: increment,child: Icon(Icons.add), backgroundColor:Colors.green),
          SizedBox(height: 10),
          FloatingActionButton(onPressed: reset,child: Icon(Icons.replay), backgroundColor:Colors.blue),
          SizedBox(height: 10),
          FloatingActionButton(onPressed: antincrement,child: Icon(Icons.remove), backgroundColor:Colors.red),
        ],
      ),
    );
  }

