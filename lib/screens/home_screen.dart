import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/screens/login_screen.dart';
import 'package:social_fast/models/user_model.dart';
import 'package:social_fast/widgets/mod_publicacion.dart';

import '../utils/responsive.dart';
import '../widgets/circle.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({ Key? key }) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  PubModel pubmodel = PubModel();
  

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
    Responsive resposive = Responsive(context);
    final double pinkSize = resposive.wp(90);
    final double orangeSize = resposive.wp(55);
    objeto(pubmodel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: resposive.height,
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
              Positioned(
                top: resposive.hp(30),
                child: Text(
                  'Bienvenido',
                  style: TextStyle(
                      fontSize: resposive.dp(4), fontWeight: FontWeight.bold),
                ),
              ),
               Positioned(
                 top: resposive.hp(36),
                 child: Text(
                   "${loggedInUser.name} ${loggedInUser.lastname}",
                   style: const TextStyle(
                       color: Colors.black, fontWeight: FontWeight.w500),
                 ),
               ),
               Positioned(
                 top: resposive.hp(38.3),
                 child: Text(
                   "${loggedInUser.email}",
                   style: const TextStyle(
                       color: Colors.black, fontWeight: FontWeight.w500),
                 ),
               ),
              Positioned(
                top: resposive.hp(41),
                child: ActionChip(
                  label: const Text('Salir'),
                  onPressed: () {
                     salir(context);
                  },
                ),
              ),
              ListView(
                padding: EdgeInsets.all(resposive.dp(1.4)),
                children: [
                modPublicacion(pubModel: pubmodel)
              ],),
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
  Future<void> salir(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}