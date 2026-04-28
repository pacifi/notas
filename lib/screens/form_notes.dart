import 'package:flutter/material.dart';
import 'package:proyecto_nota/modelo/nota.dart';

class FormNota extends StatefulWidget {
  const FormNota({super.key});

  @override
  State<FormNota> createState() => _FormNotaState();
}

class _FormNotaState extends State<FormNota> {
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario Nota", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: controllerNombre,
              decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerDescription,
              decoration: InputDecoration(
                labelText: "Descripción",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controllerNombre.text.isNotEmpty && controllerDescription.text.isNotEmpty) {
                  Nota nota = Nota(
                    controllerNombre.text,
                    controllerDescription.text,
                  );
                  Navigator.pop(context, nota);
                }
              },
              child: Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
