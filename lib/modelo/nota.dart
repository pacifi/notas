class Nota {
  String nombre;
  String descripcion;
  DateTime fecha;

  Nota(this.nombre, this.descripcion) : fecha = DateTime.now();
}
