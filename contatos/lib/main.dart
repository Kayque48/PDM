import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Contatos(),
  ));
}

// ----------- TELA 1 -----------

class Contatos extends StatelessWidget {
  List<String> contato1 = ["Kayque", "(19) 99818-3546"];
  List<String> contato2 = ["Henrique", "(19) 97149-2008"];
  List<String> contato3 = ["João", "(19) 99999-9999"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos os Contatos", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(contato1[0]),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalheContato(
                      nome: contato1[0],
                      telefone: contato1[1],
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text(contato2[0]),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalheContato(
                      nome: contato2[0],
                      telefone: contato2[1],
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text(contato3[0]),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalheContato(
                      nome: contato3[0],
                      telefone: contato3[1],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






// ----------- TELA 1 -----------

class DetalheContato extends StatelessWidget {

  final String nome;
  final String telefone;

  
  DetalheContato({required this.nome, required this.telefone});
  
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
          Text("Nome: $nome\nTelefone: $telefone"),
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