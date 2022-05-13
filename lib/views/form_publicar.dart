import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_fast/services/storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/services/uploadImage.dart';
import 'package:social_fast/utils/responsive.dart';

//import 'package:image_picker/image_picker.dart';

class formPublicacion extends StatefulWidget {
  double altura;
  formPublicacion({Key? key, required this.altura})
      : assert(altura != null),
        super(key: key);

  @override
  State<formPublicacion> createState() => _formPublicacionState();
}

class _formPublicacionState extends State<formPublicacion> {
  final TextEditingController publicacionController =
      new TextEditingController();
  UploadImage auth = UploadImage();
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final Responsive responsive = Responsive.of(context);

    final publicacionField = TextFormField(
      //?autofocus: false,
      controller: publicacionController,
      validator: (value) {
        if (value!.isEmpty) {
          return ('No puede estar vacio.');
        }
      },
      onSaved: (value) {
        publicacionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.add_comment,
          //color: Colors.white,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Agregar publicacion.",
        hintStyle: TextStyle(fontSize: responsive.dp(2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    return Container(
      margin: const EdgeInsets.all(8),
      width: double.maxFinite,
      //color: Colors.black38,
      decoration: BoxDecoration(
        color: const Color.fromARGB(43, 0, 0, 0),
        borderRadius: BorderRadius.all(
          Radius.circular(
            responsive.dp(1),
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: responsive.wp(1.2),
                height: responsive.hp(8),
              ),
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/img/pru1.jpeg'),
              ),
              SizedBox(
                width: responsive.wp(2),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/publicacion"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          responsive.dp(1),
                        ),
                      ),
                    ),
                    child: publicacionField,
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.symmetric(vertical: 0),
                onPressed: () {
                  if (_image != null) {
                    auth.requesUpdateImage(
                        content: publicacionController.text, image: _image);

                    publicacionController.text = "";
                  } else {
                    if (publicacionController.text != null &&
                        publicacionController.text != "") {
                      auth.requesUpdateImage(
                          content: publicacionController.text);
                      publicacionController.text = "";
                    } else {
                      Fluttertoast.showToast(
                          msg: "La publicacion no puede estar vacia");
                    }
                  }

                  setState(() {
                    _image = null;
                  });
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  splashRadius: 20,
                  onPressed: () async {
                    Fluttertoast.showToast(msg: "Abriendo galeria");

                    _openGallery(context);
                  },
                  icon: const Icon(Icons.photo)),
              IconButton(
                  splashRadius: 20,
                  onPressed: () async {
                    Fluttertoast.showToast(msg: "Abriendo camara");
                    _openCamera(context);
                  },
                  icon: const Icon(Icons.camera_alt)),
            ],
          ),
          //? agregar vizualizador
          _image != null
              ? CircleAvatar(
                  backgroundImage: FileImage(_image!),
                  radius: 75.0,
                )
              : Container(),

          SizedBox(
            height: responsive.hp(1),
          )
          // ClipOval(
          //     child: Container(
          //       width: responsive.width * .4,
          //       height: responsive.height * .2,
          //       color: Colors.orange,
          //       child: const Image(
          //         image: NetworkImage(
          //             "https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg"),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
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

  void _openCamera(BuildContext context) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 480, maxWidth: 640);
    try {
      setState(() {
        _image = File(pickedFile!.path);
      });
      //Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }
}
