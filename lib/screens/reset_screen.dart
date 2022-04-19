
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Cambio de contraseña")),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined, color: Colors.pinkAccent),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: ("Email"),
            ),
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                textColor: Colors.white,
                child: const Text("Enviar solicitud",),
                onPressed: (){
                  _auth.sendPasswordResetEmail(email: email);
                  Navigator.of(context).pop();
                },
                color: Colors.pinkAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              )
            ],
          )
        ],
      ),
    );
  }
}