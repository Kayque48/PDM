  import 'package:flutter/material.dart';
  import 'package:sqflite/sqflite.dart';
  import 'package:path/path.dart' as p;
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
    TextEditingController controllerTitulo = TextEditingController();
    TextEditingController controllerDescricao = TextEditingController();
    @override
    void initState() {
      super.initState();
      carregarDados();
    }
    List<Map<String, dynamic>> dados = [];

    Future<Database> criarBanco() async {
      final caminho = await getDatabasesPath();
      final path = p.join(caminho, "banco.db");

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

    Future<void> inserirDados(String titulo, String descricao) async {
      final db = await criarBanco();

      await db.insert("dados", {"titulo" : titulo, "descricao" : descricao});

      carregarDados();
    }

    Future<void> carregarDados() async {
      final db = await criarBanco(); 

      final lista = await db.query(
        "dados",
        orderBy: "titulo ASC",
      );

      setState(() {
        dados = lista;
      });
    }

    Future<void> atualizarDado(int id, String titulo, String descricao) async {
      final db = await criarBanco();

      await db.update(
        "dados",
        {"titulo": titulo, "descricao": descricao },
        where: "id = ?",
        whereArgs: [id],
      );

      carregarDados();
    }

    Future<void> deletarDado (int id) async {
      final db = await criarBanco(); 

      await db.delete("dados", where: "id= ?", whereArgs: [id]);
      carregarDados();
    }

    void abrirEdicao(Map<String, dynamic> dado) {
  final editTitulo = TextEditingController(text: dado["titulo"]);
  final editDescricao = TextEditingController(text: dado["descricao"]);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Editar Dado"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: editTitulo,
            decoration: InputDecoration(
              labelText: "Título",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: editDescricao,
            decoration: InputDecoration(
              labelText: "Descrição",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            if (editTitulo.text.isNotEmpty && editDescricao.text.isNotEmpty) {
              atualizarDado(dado["id"], editTitulo.text, editDescricao.text);
              Navigator.pop(context);
            }
          },
          child: Text("Salvar"),
        ),
      ],
    ),
  );
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
                controller: controllerTitulo,
                decoration: InputDecoration(
                  labelText: "Título do Dado",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controllerDescricao,
                decoration: InputDecoration(
                  labelText: "Descrição do Dado",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controllerTitulo.text.isNotEmpty && controllerDescricao.text.isNotEmpty) {
                  inserirDados(controllerTitulo.text, controllerDescricao.text);
                  controllerTitulo.clear();
                  controllerDescricao.clear();
                }
              },
              child: Text("Salvar"),
            ),
            Expanded(
              child: dados.isEmpty
              ? Center(child: Text("Nenhum dado cadastrado"))
              : ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dados[index]["titulo"]),
                    subtitle: Text(dados[index]["descricao"] ?? ""),
                    onTap: () => abrirEdicao(dados[index]),
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