import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/screens/home_screen.dart';
import 'package:social_fast/screens/raiz.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/circle.dart';

import '../models/user_model.dart';

class registro_screen extends StatefulWidget {
  const registro_screen({Key? key}) : super(key: key);

  @override
  _registro_screenState createState() => _registro_screenState();
}

class _registro_screenState extends State<registro_screen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final nameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confPasswordEditingController = TextEditingController();
  final telEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    //nombre
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("nombre no puede estar vacío");
        }
        if (!regex.hasMatch(value)) {
          return ("por favor ingrese una nombre de min. 3 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle_rounded,
            color: Colors.orangeAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nombre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => telEditingController.clear(),
        ),
      ),
    );
    //apellido
    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("apellido no puede estar vacío");
        }
        if (!regex.hasMatch(value)) {
          return ("por favor ingrese una apellido de min. 3 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle_rounded,
            color: Colors.orangeAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Apellido",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => telEditingController.clear(),
        ),
      ),
    );
    //correo
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Por favor ingrese su correo');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Por favor, ingrese un correo válido");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon:
            const Icon(Icons.email_outlined, color: Colors.orangeAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Correo",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => telEditingController.clear(),
        ),
      ),
    );
    //contraseña
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Requiero una contraseña ");
        }
        if (!regex.hasMatch(value)) {
          return ("por favor ingrese una contraseña de min. 6 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key, color: Colors.orangeAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    //confirmar contraseña
    final confpasswordField = TextFormField(
      autofocus: false,
      controller: confPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confPasswordEditingController.text !=
            passwordEditingController.text) {
          return ('La contraseña no coincide');
        }
        return null;
      },
      onSaved: (value) {
        confPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key, color: Colors.orangeAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirmar contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    //registrar
    final telField = TextFormField(
      autofocus: false,
      controller: telEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{10,}$');
        if (value!.isEmpty) {
          return ("telefono no puede estar vacío");
        }
        if (!regex.hasMatch(value)) {
          return ("Por favor, ingrese una telefono válido de 10. números");
        }
        return null;
      },
      onSaved: (value) {
        telEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone, color: Colors.orangeAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Teléfono",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => telEditingController.clear(),
        ),
      ),
    );
    final registroButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orangeAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          singUp(emailEditingController.text, passwordEditingController.text);
        },
        child: const Text(
          "Registrarse",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: responsive.width,
            height: responsive.height * 0.71,
            color: Colors.white70,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: -orangeSize * 0.1,
                  top: -orangeSize * 0.6,
                  child: Circle(
                    size: orangeSize,
                    colors: const [
                      Color.fromARGB(255, 33, 76, 93),
                      Color.fromARGB(255, 33, 76, 93),
                    ],
                  ),
                ),
                Positioned(
                  top: -pinkSize * 0.5,
                  right: -pinkSize * 0.3,
                  child: Circle(
                    size: pinkSize,
                    colors: const [
                      Colors.amber,
                      Color.fromARGB(255, 225, 112, 6),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: responsive.hp(6),
                          ),
                          const SizedBox(
                            height: 90,
                            child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/a.jpg')),
                          ),
                          // const Text("Registro", style: TextStyle(color: Colors.pinkAccent, fontSize: 5+40)),
                          const SizedBox(height: 20),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(85),
                              child: nameField),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(85),
                              child: lastnameField),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(85),
                              child: emailField),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(85),
                              child: telField),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(85),
                              child: passwordField),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(85),
                              child: confpasswordField),
                          SizedBox(
                              height: responsive.hp(7),
                              width: responsive.wp(45),
                              child: registroButton),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void singUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()});
      } on FirebaseAuthException {
        Fluttertoast.showToast(msg: "el correo pertenece a otra cuenta");
      }
    }
  }

  postDetailsToFirestore() async {
    // llamar nuestra BD
    //llamar el modelo del usuario
    //enviar los datos
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //escribir todos los valores

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;
    userModel.lastname = lastNameEditingController.text;
    userModel.tel = telEditingController.text;

    await firebaseFirestore
        .collection("usuarios")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Cuenta creada");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => raiz()), (route) => false);
  }
}
