import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_fast/screens/raiz.dart';
import 'package:social_fast/services/uploadImageProfile.dart';
import 'package:social_fast/utils/responsive.dart';

import '../widgets/circle.dart';

class editarPerfil extends StatefulWidget {
  const editarPerfil({Key? key}) : super(key: key);

  @override
  State<editarPerfil> createState() => _editarPerfilState();
}

class _editarPerfilState extends State<editarPerfil> {
  final TextEditingController descripPerfilController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  UploadImageProfile auth = UploadImageProfile();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    final descripPerfil = TextFormField(
      autofocus: false,
      maxLines: 3,
      controller: descripPerfilController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Requiero una información");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese información válida, min. 6 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        descripPerfilController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        //prefixIcon: const Icon(Icons.add_comment,size: 30, color: Color.fromARGB(255, 225, 112, 6),),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "Acerca de mí... ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Editar perfil"),
          backgroundColor: Colors.orange,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) =>  raiz(),));
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                height: responsive.height,
                color: Colors.white,
                child: Stack(alignment: Alignment.topLeft, children: <Widget>[
                  ListView(
                    children: [
                      Column(
                        children: <Widget>[
                          SizedBox(
                            //width: responsive.width,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: responsive.wp(20),
                                ),
                                Text(
                                      "Foto del perfil ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: responsive.dp(3),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: responsive.hp(3),
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [ 
                                    SizedBox(
                                      width: responsive.wp(28),
                                    ),
                                    
                                  ],
                                ),
                                _image != null
                                    ? CircleAvatar(
                                        backgroundImage: FileImage(_image!),
                                        radius: 75.0,
                                      )
                                    : ClipOval(
                                        child: Container(
                                          width: responsive.width * .4,
                                          height: responsive.height * .2,
                                          color: Colors.orange,
                                          child: const Image(
                                            image: NetworkImage(
                                                "https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                       SizedBox(
                                      height: responsive.hp(2),
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton.icon(
                                      icon: const Icon(Icons.add_task),
                                      label: Text('Editar',
                                          textScaleFactor: responsive.dp(0.18)),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        padding: const EdgeInsets.only(
                                            left: 7.0, right: 12.0),
                                        backgroundColor: const Color.fromARGB(255, 225, 112, 6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        _openGallery(context);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: responsive.hp(3),
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "Descripción ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: responsive.dp(3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: responsive.wp(30),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(
                                      height: responsive.hp(2),
                                    ),
                          SizedBox(
                            width: responsive.wp(90),
                            height: responsive.hp(10),
                            child: descripPerfil, 
                          ),
                          SizedBox(
                                  height: responsive.wp(5),
                                ),
                          TextButton.icon(
                            icon: const Icon(Icons.add_task),
                            label: Text('Guardar',
                                textScaleFactor: responsive.dp(0.18)),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding:
                                  const EdgeInsets.only(left: 7.0, right: 12.0),
                              backgroundColor:
                                  const Color.fromARGB(255, 225, 112, 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            onPressed: () {
                              auth.requesUpdateImageProfile(image: _image);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ]))));
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 480, maxWidth: 640);
    try {
      setState(() {
        _image = File(pickedFile!.path);
      });
      //Navigator.of(context).pop();
    } catch (e) {}
  }
}
