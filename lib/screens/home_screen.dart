import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/screens/login_screen.dart';
import 'package:social_fast/models/user_model.dart';
import 'package:social_fast/views/form_publicar.dart';
import 'package:social_fast/widgets/mod_publicacion.dart';

import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/circle.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  PubModel pubmodel = PubModel();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      _auth.currentUser!
          .updateDisplayName("${loggedInUser.name} ${loggedInUser.lastname}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    objeto(pubmodel);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Publicaciones',
          style: TextStyle(fontSize: responsive.dp(3), color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: responsive.height * 0.82,
          color: Colors.white,
          child: Stack(
            //alignment: Alignment.center,
            children: <Widget>[
              Column(
                children: [
                  formPublicacion(altura: 0),
                  modPublicacion(
                    pubModel: pubmodel,
                  ),
                ],
              ),

              //?
            ],
          ),
        ),
      ),
    );
  }

  void objeto(PubModel pubModel) {
    pubModel.id = '1';
    pubModel.uid = loggedInUser.uid;
    pubModel.uName = "${loggedInUser.name} ${loggedInUser.lastname}";
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
