import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/screens/home_screen.dart';
import 'package:social_fast/screens/raiz.dart';
import 'package:social_fast/screens/registro_screen.dart';
import 'package:social_fast/screens/reset_screen.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:social_fast/widgets/icon_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    const double ancho = 70;
    const double alto = 5.5;

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Requiero una contraseña");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contraseña válida, min. 6 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon:
            const Icon(Icons.lock_clock_outlined, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: (
          const Icon(Icons.visibility)
        ),
      ),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Colors.pinkAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          sigIn(emailController.text, passwordController.text);
        },
        child: const Text(
          "Log In",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: responsive.width,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -pinkSize * 0.5,
                  right: -pinkSize * 0.3,
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
                  left: -orangeSize * 0.1,
                  top: -orangeSize * 0.6,
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
                  top: pinkSize * 0.25,
                  child: Column(
                    children: <Widget>[
                      // const Text("SOCIAL FAST", style: TextStyle(color: Colors.black, fontSize: 30)),
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                      IconContainer(
                        //tamaño del icono avatar
                        size: responsive.wp(30),
                      ),
                      SizedBox(
                        height: responsive.hp(5),
                      ),
                      SizedBox(
                        width: responsive.wp(ancho),
                        height: responsive.hp(alto),
                        child: emailField,
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      SizedBox(
                        width: responsive.wp(ancho),
                        height: responsive.hp(alto),
                        child: passwordField,
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      SizedBox(
                        width: responsive.wp(40),
                        height: responsive.hp(7),
                        child: loginButton,
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '¿No tienes cuenta? Regístrese ',
                            style: TextStyle(fontSize: responsive.dp(1.7)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const registro_screen()));
                            },
                            child: Text(
                              'aquí',
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: responsive.dp(1.7)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(
                              "¿Olvidó su contraseña?",
                              style: TextStyle(fontSize: responsive.dp(1.7)),
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => reset_screen())),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sigIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Inicio Exitoso");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => raiz()));
    } on FirebaseAuthException {
      Fluttertoast.showToast(
          msg: "Usuario o contraseña incorrectos", gravity: ToastGravity.TOP);
    }
  }
}
