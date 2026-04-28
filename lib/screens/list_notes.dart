import 'package:flutter/material.dart';
import 'package:proyecto_nota/modelo/nota.dart';
import 'package:proyecto_nota/screens/detail_notes.dart';
import 'package:proyecto_nota/screens/form_notes.dart';

class ListNota extends StatefulWidget {
  const ListNota({super.key});

  @override
  State<ListNota> createState() => _ListNotaState();
}

class _ListNotaState extends State<ListNota> {
  List<Nota> notas = [];

  @override
  Widget build(BuildContext context) {
    // notas.add(Nota("nombre", "lorem asdasdasdasda s"));
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Notas"),
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final nota = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormNota()),
          );
          if (nota != null) {
            setState(() => notas.add(nota));
          }
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notas.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(notas[index].nombre),
              subtitle: Text(notas[index].descripcion),
              trailing: Text("${notas[index].fecha}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailNote(nota: notas[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
