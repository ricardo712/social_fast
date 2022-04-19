import 'package:flutter/material.dart';
class registro_screen extends StatefulWidget {
  const registro_screen({ Key? key }) : super(key: key);

  @override
  _registro_screenState createState() => _registro_screenState();
}

class _registro_screenState extends State<registro_screen> {
  
  final _formKey = GlobalKey<FormState>();

  final nameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confPasswordEditingController = TextEditingController();
  final telEditingController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    //nombre
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex =  RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("nombre no puede estar vacío");
        }
        if(!regex.hasMatch(value)){
          return("por favor ingrese una nombre de min. 3 caracteres");
        }
        return null;
      },
      onSaved: (value){
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.account_circle_rounded, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nombre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
         suffixIcon:  IconButton(
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
      validator: (value){
        RegExp regex =  RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("apellido no puede estar vacío");
        }
        if(!regex.hasMatch(value)){
          return("por favor ingrese una apellido de min. 3 caracteres");
        }
        return null;
      },
      onSaved: (value){
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.account_circle_rounded, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Apellido",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
         suffixIcon:  IconButton(
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
      validator: (value){
        if(value!.isEmpty){
          return ('Por favor ingrese su correo');
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return ("Por favor, ingrese un correo válido");
        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Correo",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
         suffixIcon:  IconButton(
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
      validator: (value){
        RegExp regex =  RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return ("Requiero una contraseña ");
        }
        if(!regex.hasMatch(value)){
          return("por favor ingrese una contraseña de min. 6 caracteres");
        }
        return null;
      },
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key, color: Colors.pinkAccent),
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
      validator: (value){
        if(confPasswordEditingController.text != passwordEditingController.text)
        {
          return ('La contraseña no coincide');
        }
        return null;
      },
      onSaved: (value){
        confPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key, color: Colors.pinkAccent),
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
      validator: (value){
        RegExp regex =  RegExp(r'^.{10,}$');
        if(value!.isEmpty){
          return ("telefono no puede estar vacío");
        }
        if(!regex.hasMatch(value)){
          return("Por favor, ingrese una telefono válido de 10. números");
        }
        return null;
      },
      onSaved: (value){
        telEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.phone, color: Colors.pinkAccent),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Teléfono",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon:  IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => telEditingController.clear(),
          ),
      ),
      );
    final registroButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30),
      color: Colors.pinkAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15) ,
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          // singUp(emailEditingController.text, passwordEditingController.text);
        },
        child: const Text("Registrarse",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );  
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       leading:  IconButton(
         icon: const Icon(Icons.arrow_back, color: Colors.pinkAccent),
         onPressed: (){
           Navigator.of(context).pop();
         },
       ),
     ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                     const SizedBox(
                      height: 90,
                      child: CircleAvatar(
                       radius: 40.0,
                        backgroundImage: AssetImage('assets/images/a.jpg')),
                     ),
                    // const Text("Registro", style: TextStyle(color: Colors.pinkAccent, fontSize: 5+40)),
                      const SizedBox(
                        height: 20
                      ),
                    nameField,
                    const SizedBox(
                        height: 20
                      ),
                    lastnameField,
                    const SizedBox(
                        height: 20
                      ),
                      emailField,
                    const SizedBox(
                        height: 20
                      ),
                      telField,
                    const SizedBox(
                        height: 20
                      ),
                      passwordField,
                    const SizedBox(
                        height: 20
                      ),
                      confpasswordField,
                    const SizedBox(
                        height: 20
                      ),
                      registroButton,
                      const SizedBox(
                        height: 15
                      ),
                  ],
                ),
              ),
            ),
          )
        )
      ),
    );
  }
}