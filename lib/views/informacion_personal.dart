import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/utils/responsive.dart';

class informacionPersonal extends StatelessWidget {
  PubModel pubModel = PubModel();
  double altura;
  double ancho;
  informacionPersonal(
      {Key? key,
      required this.pubModel,
      required this.altura,
      required this.ancho})
      : assert(pubModel != null),
        assert(altura != null),
        assert(ancho != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final String ciudadVive = "Popayán";
    final String ciudad = "Bolivar";
    final String relacion = "Sin relacion";
    final String numAmigos = "1";

    return Container(
      width: responsive.wp(88),
      height: responsive.hp(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        //color: Colors.black12,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              const Icon(
                Icons.home,
              ),
              Text(
                "Vive en: " + ciudadVive,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(2),
                  //fontFamily: ,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              Text(
                "De: " + ciudad,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(2),
                  //fontFamily: ,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.heart_broken_outlined),
              Text(
                "Relación: " + relacion,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(2),
                  //fontFamily: ,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.home),
              Text(
                "Amigos: " + numAmigos,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(2),
                  //fontFamily: ,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
