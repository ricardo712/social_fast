import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/services/storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/utils/responsive.dart';

class verAmigo extends StatelessWidget {
  double altura;
  PubModel pubModel;
  File? fotoPerfil;
  verAmigo(
      {Key? key, required this.altura, required this.pubModel, this.fotoPerfil})
      : assert(altura != null),
        assert(pubModel != null),
        super(key: key);

  final TextEditingController publicacionController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final Responsive responsive = Responsive.of(context);
    final String nameUser = "${pubModel.uName}";
    //final ImagePicker _picker = ImagePicker();

    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/img/pru1.jpeg'),
            ),
            SizedBox(
              width: responsive.wp(2),
            ),
            SizedBox(
              width: responsive.wp(13),
              child: Text(
                nameUser,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsive.dp(1.5),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
