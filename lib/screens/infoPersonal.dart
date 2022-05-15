import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/screens/perfil_personal.dart';
import 'package:social_fast/screens/raiz.dart';
import 'package:social_fast/views/informacion_personal.dart';
import 'package:social_fast/views/form_publicar.dart';

import '../utils/responsive.dart';
import '../widgets/circle.dart';

class InfoPersonal extends StatefulWidget {
  InfoPersonal({Key? key}) : super(key: key);

  @override
  State<InfoPersonal> createState() => _infopersonalState();
}

class _infopersonalState extends State<InfoPersonal> {
  final TextEditingController editarinfopersonalController =
      TextEditingController();
  final TextEditingController pasatiempocontroller = TextEditingController();
  PubModel pubModel = PubModel();

  void objeto(PubModel pubModel) {
    pubModel.id = '1';
    pubModel.uid = '1058';
    pubModel.uName = 'Jhon Ruiz';
    pubModel.mensaje = 'Un buen paisaje.';
    pubModel.fecha = '07/04/2022';
    pubModel.hora = '16:36';
    pubModel.imagen = 'vacio';
  }

  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final double pinkSize = resposive.wp(90);
    final double orangeSize = resposive.wp(55);
    objeto(pubModel);
    // const double ancho = 70;
    // const double alto = 5.5;
    final editarinfpersonal = TextFormField(
      autofocus: false,
      controller: editarinfopersonalController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Requiero una información");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese información válida, min. 6 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        editarinfopersonalController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        //prefixIcon: const Icon(Icons.add_comment, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "Descríbete",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    final pasatiempo = TextFormField(
      autofocus: false,
      controller: pasatiempocontroller,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Requiero una información");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese información válida, min. 6 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        editarinfopersonalController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        //prefixIcon: const Icon(Icons.add_comment, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "Detalles ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar información personal"),
        backgroundColor: const Color.fromARGB(255, 225, 112, 6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => raiz(),
            //     ));
          },
        ),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: resposive.height,
            color: Colors.white,
            child: Column( children: <Widget>[
              Positioned(
                top: pinkSize * 0.100,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: resposive.wp(5),
                            height: resposive.hp(10),
                          ),
                          Text(
                            "Presentación ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: resposive.dp(3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: resposive.wp(90),
                      height: resposive.hp(10),
                      child: editarinfpersonal,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: pinkSize * 0.45,
                child: Column(children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                            width: resposive.wp(5),
                          ),
                        Text(
                          "Detalles ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: resposive.dp(3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: resposive.wp(40),
                        ),
                        TextButton.icon(
                          icon: const Icon(Icons.edit_attributes),
                          label: Text('Editar',
                              textScaleFactor: resposive.dp(0.18)),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding:
                                const EdgeInsets.only(left: 7.0, right: 12.0),
                            backgroundColor:
                                const Color.fromARGB(255, 225, 112, 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  informacionPersonal(
                    altura: 20,
                    pubModel: pubModel,
                    ancho: 2,
                  ),
                ]),
              ),
              Positioned(
                top: resposive.hp(45),
                child: Column(children: <Widget>[
                  SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                            width: resposive.wp(5),
                            height: resposive.hp(10),
                          ),
                        Text(
                          "Pasatiempos ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: resposive.dp(3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: resposive.wp(90),
                    height: resposive.hp(10),
                    child: pasatiempo,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.add_task),
                        label: Text('Guardar',
                            textScaleFactor: resposive.dp(0.18)),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding:
                              const EdgeInsets.only(left: 7.0, right: 12.0),
                          backgroundColor:
                              const Color.fromARGB(255, 225, 112, 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
