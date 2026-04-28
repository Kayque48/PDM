  import 'package:flutter/material.dart';
  import 'package:sqflite/sqflite.dart';
  import 'package:path/path.dart';
  void main() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBanco(),
    ));
  }


  class AppBanco extends StatefulWidget {
    @override  
    _AppBancoState createState() => _AppBancoState();
  }

  class _AppBancoState extends State<AppBanco> {
    TextEditingController controller = TextEditingController();
    List<Map<String, dynamic>> dados = [];

    Future<Database> criarBanco() async {
      final caminho = await getDatabasesPath();
      final path = join(caminho, "banco.db");

      return openDatabase(
        path,
        onCreate: (db,version) {
          return db.execute(
            "CREATE TABLE dados(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao TEXT)"
          );
        },
        version: 1,
        );
    }

    Future<void> inserirDado(String titulo) async {
      final db = await criarBanco();

      await db.insert("dados", {"titulo" : titulo});

      carregarDados();
    }

    Future<void> carregarDados() async {
      final db = await criarBanco(); 

      final lista = await db.query("dados");

      setState(() {
        dados = lista;
      });
    }

    Future<void> deletarDado (int id) async {
      final db = await criarBanco(); 

      await db.delete("dados", where: "id= ?", whereArgs: [id]);
      carregarDados();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Banco De Dados")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Título do Dado",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  inserirDado(controller.text);
                  controller.clear();
                }
              },
              child: Text("Adicionar"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dados[index]["titulo"]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deletarDado(dados[index]["id"]);
                      },
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