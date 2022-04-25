import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/models/user_model.dart';
import 'package:social_fast/ui/widgets.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:social_fast/widgets/mod_notificaccion.dart';
import 'package:social_fast/widgets/mod_publicacion.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({Key? key}) : super(key: key);

  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
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

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    final size = MediaQuery.of(context).size;
    final mensajeNotificacion =
        "Tienes una nueva sugerencia\nde amistad de ${pubModel.uName}";
    final fecha = pubModel.fecha;
    final menPub = pubModel.mensaje;
    objeto(pubModel);
    String sugerencia = "Tienes una nueva sugerencia de amistad";
    String like = "Le gusta tu foto a ";

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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: responsive.height * 0.82,
          color: Colors.white,
          child: Stack(
            //alignment: Alignment.center,
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
                  Container(
                    //color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.all(responsive.dp(2)),
                    width: responsive.wp(94.3),
                    //height: responsive.hp(85),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          responsive.dp(7),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Notificaciones.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: responsive.dp(3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Nuevas.",
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: responsive.dp(2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: responsive.hp(1),
                        ),
                        modNotificacion(mensaje: sugerencia, name: "Jhon Ruiz"),
                        SizedBox(
                          height: responsive.hp(1),
                        ),
                        modNotificacion(
                          mensaje: sugerencia,
                          name: "Mateo Avila",
                        ),
                        SizedBox(
                          height: responsive.hp(1),
                        ),
                        modNotificacion(mensaje: sugerencia, name: "Carmen St"),
                        SizedBox(height: responsive.hp(1)),
                        Row(
                          children: [
                            Text(
                              "Anteriores.",
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: responsive.dp(2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: responsive.hp(1)),
                        modNotificacion(mensaje: like, name: "Carmen St"),
                        SizedBox(height: responsive.hp(1)),
                        modNotificacion(mensaje: like, name: "Anastasia "),
                        SizedBox(height: responsive.hp(1)),
                        modNotificacion(mensaje: like, name: "Anastasia "),
                        SizedBox(height: responsive.hp(1)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void objeto(PubModel pubModel) {
    pubModel.id = '1';
    pubModel.uid = '1058';
    pubModel.uName = 'Jhon Ruiz';
    pubModel.mensaje = 'Un buen paisaje.';
    pubModel.fecha = '07/04/2022';
    pubModel.hora = '16:36';
    pubModel.imagen = 'vacio';
  }

  Widget _appBarPost(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.of(context).pop();
            }, //=> Navigator.pushAndRemoveUntil(
            // 'context', routeSlide(page: ejemplo1()), (_) => false),

            icon: const Icon(Icons.arrow_back)),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          onPressed: () {},
          child: const TextFrave(
            text: 'Publicar',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 5,
          ),
        ),
        //TextButton(onPressed: () {}, child: const Text('Hola'))
      ],
    );
  }
}
