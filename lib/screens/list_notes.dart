import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_nota/modelo/nota.dart';
import 'package:proyecto_nota/screens/detail_notes.dart';
import 'package:proyecto_nota/screens/form_notes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListNota extends StatefulWidget {
  const ListNota({super.key});

  @override
  State<ListNota> createState() => _ListNotaState();
}

class _ListNotaState extends State<ListNota> {
  List<Nota> notas = [];

  @override
  void initState() {
    super.initState();
    this.cargarNotas();
  }

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
            guardarNota();
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

  Future<void> cargarNotas() async {
    final prefs = await SharedPreferences.getInstance();
    final datos = prefs.getStringList('notas') ?? [];
    setState(() {
      notas = datos
          .map((datoJson) => Nota.fromJson(jsonDecode(datoJson)))
          .toList();
    });
  }

  Future<void> guardarNota() async {
    // guardamos toda la lista por que no guarda elemento a elemento
    final prefs = await SharedPreferences.getInstance();
    final datos = notas.map((nota) => jsonEncode(nota.toJson())).toList();
    prefs.setStringList("notas", datos);
  }
}
