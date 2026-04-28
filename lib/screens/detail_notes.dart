import 'package:flutter/material.dart';
import 'package:proyecto_nota/modelo/nota.dart';

class DetailNote extends StatelessWidget {
  final Nota nota;

  const DetailNote({super.key, required this.nota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de Nota"),
        backgroundColor: Colors.orange,
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${nota.nombre}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${nota.descripcion}", style: TextStyle(fontSize: 20)),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text("${nota.fecha}")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
