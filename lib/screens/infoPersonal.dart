import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/views/informacion_personal.dart';
import 'package:social_fast/views/form_publicar.dart';

import '../utils/responsive.dart';
import '../widgets/circle.dart';

class infopersonal extends StatefulWidget {
  infopersonal({Key? key}) : super(key: key);

  @override
  State<infopersonal> createState() => _infopersonalState();
}

class _infopersonalState extends State<infopersonal> {
  final TextEditingController editarinfopersonalController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final double pinkSize = resposive.wp(90);
    final double orangeSize = resposive.wp(55);
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
        prefixIcon: const Icon(Icons.add_comment, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "Descríbete",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Editar información personal"),
          backgroundColor: Colors.pink,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: GestureDetector(
            child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: resposive.height,
            color: Colors.white,
            child: Stack(alignment: Alignment.topLeft, children: <Widget>[
              Positioned(
                right: -(pinkSize) * 0.3,
                top: -(pinkSize) * 0.5,
                child: Circle(
                  size: pinkSize,
                  colors: const [
                    Colors.pink,
                    Colors.pinkAccent,
                    //Colors.yellow,
                  ],
                ),
              ),
              Positioned(
                left: -(orangeSize) * 0.1,
                top: -(orangeSize) * 0.6,
                child: Circle(
                  size: orangeSize,
                  colors: const [
                    Colors.orange,
                    Colors.deepOrangeAccent,
                    //Colors.yellow,
                  ],
                ),
              ),
              Positioned(
                top: pinkSize * 0.100,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                            "Presentación ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: resposive.dp(3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: resposive.wp(30),
                          ),
                          TextButton.icon(
                            icon: const Icon(Icons.person_add_alt_outlined),
                            label: Text('Agregar',
                                textScaleFactor: resposive.dp(0.18)),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding:
                                  const EdgeInsets.only(left: 7.0, right: 12.0),
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: "Información agregada",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: resposive.wp(90),
                      height: resposive.hp(20),
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
                          width: resposive.wp(50),
                        ),
                        TextButton.icon(
                          icon: const Icon(Icons.edit_attributes),
                          label: Text('Editar',
                              textScaleFactor: resposive.dp(0.18)),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            padding:
                                const EdgeInsets.only(left: 7.0, right: 12.0),
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const informacionPersonal(),
                ]),
              ),
               Positioned(
                 top: resposive.hp(45),
                 child: Column(children: <Widget>[
                   SizedBox(
                     child: Row(
                       children: [
                         Text(
                           "Pasatiempos ",
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: resposive.dp(3),
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(
                           width: resposive.wp(36),
                         ),
                         TextButton.icon(
                           icon: const Icon(Icons.add_task),
                           label: Text('Editar',
                               textScaleFactor: resposive.dp(0.18)),
                           style: TextButton.styleFrom(
                             primary: Colors.white,
                             padding:
                                 const EdgeInsets.only(left: 7.0, right: 12.0),
                             backgroundColor: Colors.pink,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50.0),
                             ),
                           ),
                           onPressed: () {},
                         ),
                       ],
                     ),
                   ),
                 ]
                 ),
               ),
               Positioned(
                 top: resposive.hp(60),
                 child: Column(children: <Widget>[
                   SizedBox(
                     child: Row(
                       children: [
                         Text(
                           "Destacados ",
                           textAlign: TextAlign.left,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: resposive.dp(3),
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(
                           width: resposive.wp(35),
                         ),
                         TextButton.icon(
                           icon: const Icon(Icons.add_a_photo),
                           label: Text('Agregar',
                               textScaleFactor: resposive.dp(0.18)),
                           style: TextButton.styleFrom(
                             primary: Colors.white,
                             padding:
                                 const EdgeInsets.only(left: 7.0, right: 12.0),
                             backgroundColor: Colors.pink,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50.0),
                             ),
                           ),
                           onPressed: () {},
                         ),
                       ],
                     ),
                   ),
                 ]),
               ),
            ]),
          ),
        )));
  }
}
