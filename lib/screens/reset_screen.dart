import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/circle.dart';

class reset_screen extends StatefulWidget {
  reset_screen({Key? key}) : super(key: key);

  @override
  State<reset_screen> createState() => _reset_screenState();
}

class _reset_screenState extends State<reset_screen> {
  late String email;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cambio de contraseña",
            style: TextStyle(color: Colors.white),
          ),
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
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 200, 40, 0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Colors.orange),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: ("Email"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          textColor: Colors.white,
                          child: const Text(
                            "Enviar solicitud",
                            style: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            _auth.sendPasswordResetEmail(email: email);
                            Navigator.of(context).pop();
                          },
                          height: 45,
                          color: Colors.orange,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        )
                      ],
                    )
                  ],
                )
              ],

              //?
            ),
          ),
        ));
  }
}
