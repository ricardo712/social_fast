import 'dart:convert';

UserModelProfile userFromJson(String str) =>
    UserModelProfile.fromJson(json.decode(str));

String userToJson(UserModelProfile data) => json.encode(data.toJson());

class UserModelProfile {
  UserModelProfile({
    required this.amigos,
    required this.date,
    required this.imagenPerfil,
    required this.lugar,
    required this.nombre,
    required this.relacion,
    required this.userUid,
    required this.vive,
  });

  final num amigos;
  final String nombre;
  final String imagenPerfil;
  final String date;
  final String lugar;
  final String relacion;
  final String userUid;
  final String vive;

  factory UserModelProfile.fromJson(Map<String, dynamic> json) =>
      UserModelProfile(
        amigos: json["amigos"],
        nombre: json["nombre"],
        date: json["date"],
        imagenPerfil: json['imagenPerfil'],
        lugar: json['lugar'],
        relacion: json['relacion'],
        userUid: json['userUid'],
        vive: json['vive'],
      );

  Map<String, dynamic> toJson() => {
        "amigos": amigos,
        "date": date,
        "imagenPerfil": imagenPerfil,
        'nombre': nombre,
        'lugar': lugar,
        'relacion': relacion,
        'userUid': userUid,
        'vive': vive,
      };
}
