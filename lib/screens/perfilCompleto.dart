import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/models/user_model.dart';
import 'package:social_fast/screens/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/ui/widgets.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/views/form_publicar.dart';
import 'package:social_fast/views/informacion_personal.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:social_fast/widgets/icon_container.dart';

class perfilCompleto extends StatefulWidget {
  const perfilCompleto({Key? key}) : super(key: key);

  @override
  State<perfilCompleto> createState() => _perfilCompletoState();
}

class _perfilCompletoState extends State<perfilCompleto> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    const userNombre = "Jhon Ruiz";
    const userNick = "Mensaje personal";

    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            children: [
              SizedBox(
                width: responsive.wp(100),
                child: _appBarPost(context),
              ),
            ],
          ),
        ],
      ),
      //backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
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
                /*Positioned(
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: _appBarPost(context),
                        ),
                      ],
                    ),
                  ),
                ),*/
                Positioned(
                  top: pinkSize * 0.25,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        //tamaño del icono avatar
                        size: responsive.wp(30),
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                      Text(
                        userNombre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userNick,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(1.5),
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      //SizedBox(height: 5.0),
                      SizedBox(
                        child: Row(
                          children: [
                            TextButton.icon(
                              icon: const Icon(Icons.person_add_alt_outlined),
                              label: Text('Agregar',
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
                                  msg: "Solicitud enviada",
                                  //fontSize: 5,
                                  //gravity: ToastGravity.TOP,
                                );
                              },
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.add_comment_outlined),
                              label: Text('Mensaje',
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
                                  msg: "Mensaje",
                                  gravity: ToastGravity.CENTER_LEFT,
                                );
                              },
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            TextButton.icon(
                              icon: const Icon(
                                  Icons.arrow_drop_down_circle_outlined),
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
                                padding:
                                    const EdgeInsets.only(left: 12.0, right: 4),
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
                      //permite crear contenedor
                    ],
                  ),
                ),
                const informacionPersonal(),
                const formPublicacion(),
                //const mostrarPublicacion(),
              ],
            ),
          ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          splashRadius: 20,
          onPressed: () {
            //Navigator.of(context).pop();
            Fluttertoast.showToast(msg: "Atras");
          }, //=> Navigator.pushAndRemoveUntil(
          // 'context', routeSlide(page: ejemplo1()), (_) => false)
        ),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          onPressed: () {
            Fluttertoast.showToast(msg: "Buscar");
          },
          child: const TextFrave(
            text: 'Buscar',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),

      ],
    );
  }
}
