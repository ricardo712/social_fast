class PubModel {
  String? id;
  String? uid;
  String? uName;
  String? mensaje;
  String? fecha;
  String? hora;
  String? imagen;

  PubModel(
      {this.id,
      this.uid,
      this.uName,
      this.mensaje,
      this.fecha,
      this.hora,
      this.imagen});

  factory PubModel.fromMap(Map) {
    return PubModel(
        id: Map['id'],
        uid: Map['uid'],
        uName: Map['uName'],
        mensaje: Map['mensaje'],
        fecha: Map['fecha'],
        hora: Map['hora'],
        imagen: Map['imagen']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'uName': uName,
      'mensaje': mensaje,
      'fecha': fecha,
      'hora': hora,
      'imagen': imagen
    };
  }
}
