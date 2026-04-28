class Nota {
  String nombre;
  String descripcion;
  DateTime fecha;

  Nota(this.nombre, this.descripcion) : fecha = DateTime.now();

  factory Nota.fromJson(Map<String, dynamic> json) {
    // constructor nombrado
    // factory importante necesario para que la logica aplique antes de crear la instancia
    Nota nota = Nota(json['nombre'], json['descripcion']);
    nota.fecha = DateTime.parse(json['fecha']);
    return nota;
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'fecha': fecha.toIso8601String(),
    };
  }
}
