import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/models/user_model.dart';
import 'package:social_fast/screens/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/views/form_publicar.dart';
import 'package:social_fast/views/informacion_personal.dart';
import 'package:social_fast/views/veramigo.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:social_fast/widgets/icon_container.dart';

import 'infoPersonal.dart';

class perfilPersonal extends StatefulWidget {
  const perfilPersonal({Key? key}) : super(key: key);

  @override
  State<perfilPersonal> createState() => _perfilPersonalState();
}

class _perfilPersonalState extends State<perfilPersonal> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  PubModel pubModel = PubModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  void objeto(PubModel pubModel) {
    pubModel.id = '1';
    pubModel.uid = '1058';
    pubModel.uName = 'Oneida Vasquez';
    pubModel.mensaje = 'Un buen paisaje.';
    pubModel.fecha = '07/04/2022';
    pubModel.hora = '16:36';
    pubModel.imagen = 'vacio';
  }

  @override
  Widget build(BuildContext context) {
    objeto(pubModel);
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    String userNombre = "${pubModel.uName}";
    const userNick = "Mensaje personal";

    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            children: [
              SizedBox(
                height: responsive.hp(6.8),
                width: responsive.wp(100),
                child: _appBarPost(context),
              ),
            ],
          ),
        ],
      ),
      //backgroundColor: Colors.blue,
      body: SizedBox(
        width: double.infinity,
        height: responsive.height * 0.82,
        child: Stack(
          children: <Widget>[
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
            ListView(
              padding: EdgeInsets.all(responsive.dp(1.5)),
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: responsive.height,
                  //color: Colors.white,
                  child: Stack(
                    //alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: pinkSize * 0.25,
                        left: responsive.wp(25), 
                        child: Column(
                          children: <Widget>[
                            IconContainer(
                              //tamaño del icono avatar
                              size: responsive.wp(20),
                            ),
                            SizedBox(
                              height: responsive.dp(1),
                            ),
                            Text(
                              userNombre,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: responsive.dp(3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),

                            const Divider(),
                            //SizedBox(height: 5.0),
                            SizedBox(
                              child: Row(
                                children: [
                                  TextButton.icon(
                                    icon: const Icon(Icons.edit),
                                    label: Text('Editar perfil',
                                        textScaleFactor: responsive.dp(0.18)),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      backgroundColor: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => infopersonal()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //permite crear contenedor
                          ],
                        ),
                      ),
                      // const Divider(),
                      informacionPersonal(
                        altura: 40.0,
                        pubModel: pubModel,
                        ancho: 3,
                      ),
                      // const Divider(),
                      Positioned(
                        top: responsive.hp(58),
                        left: responsive.wp(9),
                        child: SizedBox(
                          child: Row(
                            children: [
                              TextButton.icon(
                                icon: const Icon(Icons.edit),
                                label: Text('Editar informacion.',
                                    textScaleFactor: responsive.dp(0.18)),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12.0),
                                  backgroundColor: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: "Ingresando...",
                                    //fontSize: 5,
                                    //gravity: ToastGravity.TOP,
                                  );
                                },
                              ),
                              SizedBox(
                                width: responsive.wp(1),
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.ads_click),
                                label: const Text(''),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: "Opciones",
                                    gravity: ToastGravity.CENTER_LEFT,
                                  );
                                  //?opciones
                                  opciones(context);
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 4),
                                  backgroundColor: Colors.pink,
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const Divider(),
                      Positioned(
                        top: responsive.hp(64),
                        left: responsive.wp(4),
                        child: Text(
                          "Amigos",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: responsive.dp(4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // const Divider(),
                      Positioned(
                        top: responsive.hp(69.8),
                        child: Container(
                          padding: EdgeInsets.all(responsive.wp(1)),
                          height: responsive.hp(12),
                          width: responsive.width,
                          //color: Colors.grey.shade300,

                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  verAmigo(altura: 68, pubModel: pubModel),
                                  SizedBox(width: responsive.wp(1)),
                                ],
                              ),
                            ],
                          ), // ? ListView.builder
                        ),
                      ),
                      // const Divider(),
                      formPublicacion(altura: 82.8),
                      //const mostrarPublicacion(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  opciones(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Amigos.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.account_box_outlined,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => infopersonal()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Información personal ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.edit_note_sharp,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    salir(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Cerrar Sesion",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.vertical_align_bottom,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> salir(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  Widget _appBarPost(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Mi perfil",
          style: TextStyle(
              fontSize: responsive.dp(3), fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
