import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoPage());
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> _todosLista = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eu vim fazer um anúncio")),
      body: Column( children: [

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Dica visual para o usuário e suporte ao Enter (onSubmitted)
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Digite sua tarefa',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => adicionarTarefa(),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: adicionarTarefa,
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _todosLista.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_todosLista[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => removerTarefa(index),
                ),
              );
            },
          ),
        )
      ],),
    );
  }

  void adicionarTarefa() {
    final texto = _controller.text.trim();
    // Não adiciona tarefas vazias (apenas espaços)
    if (texto.isEmpty) return;

    setState(() {
      _todosLista.add(texto);
    });
    _controller.clear();
    // Ajuda debug: confira o console se não tiver certeza do valor
    // ignore: avoid_print
    print('Tarefa adicionada: $texto');
  }

  void removerTarefa(int index) {
    setState(() {
      _todosLista.removeAt(index);
    });
  }

}

  






