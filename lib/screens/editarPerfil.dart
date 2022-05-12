import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/screens/raiz.dart';
import 'package:social_fast/utils/responsive.dart';

import '../widgets/circle.dart';

class editarPerfil extends StatefulWidget {
  const editarPerfil({Key? key}) : super(key: key);

  @override
  State<editarPerfil> createState() => _editarPerfilState();
}

class _editarPerfilState extends State<editarPerfil> {
  final TextEditingController descripPerfilController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final double pinkSize = resposive.wp(90);
    final double orangeSize = resposive.wp(55);
    final descripPerfil = TextFormField(
      autofocus: false,
      controller: descripPerfilController,
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
        descripPerfilController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.add_comment, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "Acerca de mí... ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Editar perfil"),
          backgroundColor: Colors.pink,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) =>  raiz(),));
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
                      child: Column(children: <Widget>[
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "Foto del perfil ",
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
                                icon: const Icon(Icons.add_task),
                                label: Text('Editar',
                                    textScaleFactor: resposive.dp(0.18)),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  padding: const EdgeInsets.only(
                                      left: 7.0, right: 12.0),
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
                    Positioned(
                      top: pinkSize * 0.45,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "Descripción ",
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
                                  icon:
                                      const Icon(Icons.person_add_alt_outlined),
                                  label: Text('Agregar',
                                      textScaleFactor: resposive.dp(0.18)),
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    padding: const EdgeInsets.only(
                                        left: 7.0, right: 12.0),
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
                            child: descripPerfil,
                          ),
                        ],
                      ),
                    ),
                  ]))),
        ));
  }
}
