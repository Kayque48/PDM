import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}

// ------------- TELA 1 -------------

class TelaInicial extends StatelessWidget {

  final String nome = 'Kayque Costa da Silva';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Ir para Segunda Tela"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SegundaTela(nome:nome)
              )
            );
          },
        )
      ),
    );
  }
}

// ------------- TELA 2 -------------

class SegundaTela extends StatelessWidget {

  final String nome;

  
  SegundaTela({required this.nome});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text("Olá, $nome", style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
          ElevatedButton(
          child: Text("Voltar", style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(  
              context
              );
          },
        )],
        ) 
      ),
    );
  }
}

