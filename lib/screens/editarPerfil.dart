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
        prefixIcon: const Icon(Icons.add_comment, color: Colors.pinkAccent),
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
          backgroundColor: Colors.pink,
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
                    children: [
                      Column(
                        children: <Widget>[
                          SizedBox(
                            //width: responsive.width,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Foto del perfil ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: responsive.dp(3),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: responsive.wp(28),
                                    ),
                                    TextButton.icon(
                                      icon: const Icon(Icons.add_task),
                                      label: Text('Editar',
                                          textScaleFactor: responsive.dp(0.18)),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        padding: const EdgeInsets.only(
                                            left: 7.0, right: 12.0),
                                        backgroundColor: Colors.pink,
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
                                Column(
                                  children: [
                                    TextButton.icon(
                                      icon: const Icon(Icons.add_task),
                                      label: Text('Guardar',
                                          textScaleFactor: responsive.dp(0.18)),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        padding: const EdgeInsets.only(
                                            left: 7.0, right: 12.0),
                                        backgroundColor: Colors.pink,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        auth.requesUpdateImageProfile(
                                            image: _image);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
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
                                TextButton.icon(
                                  icon:
                                      const Icon(Icons.person_add_alt_outlined),
                                  label: Text('Agregar',
                                      textScaleFactor: responsive.dp(0.18)),
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    padding: const EdgeInsets.only(
                                        left: 7.0, right: 12.0),
                                    backgroundColor: Colors.pink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: "Información agregada",
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: responsive.wp(90),
                            height: responsive.hp(20),
                            child: descripPerfil,
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
