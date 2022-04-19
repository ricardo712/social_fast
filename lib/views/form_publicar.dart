import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/services/storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:dio/dio.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:social_fast/widgets/input_comen.dart';

class formPublicacion extends StatefulWidget {
  const formPublicacion({Key? key}) : super(key: key);

  @override
  State<formPublicacion> createState() => _formPublicacionState();
}

class _formPublicacionState extends State<formPublicacion> {
  final TextEditingController publicacionController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final Responsive responsive = Responsive.of(context);
    //final ImagePicker _picker = ImagePicker();
    final publicacionField = TextFormField(
      //?autofocus: false,
      controller: publicacionController,
      validator: (value) {
        if (value!.isEmpty) {
          return ('Por favor ingrese su correo');
        }
      },
      onSaved: (value) {
        publicacionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.add_comment),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Agregar publicacion.",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    return Positioned(
      top: responsive.hp(70),
      left: responsive.wp(2),
      right: responsive.wp(2),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
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
                  child:
                      publicacionField, /*const InputComent(
                    keyboardType: TextInputType.text,
                    label: "Agregar publicacion.",
                  ),*/
                ),
              ),
              IconButton(
                padding: const EdgeInsets.symmetric(vertical: 0),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Agregando publicación. " +
                          publicacionController.text);
                  publicacionController.text = "";
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

                    final results = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png', 'jpg'],
                    );
                    if (results == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("No hay archivos seleccionados."),
                        ),
                      );
                      return;
                    }
                    final path = results.files.single.path!;
                    final fileName = results.files.single.name;
                    print(path);
                    print(fileName);

                    storage //?Carga de imagen a firebase
                        .uploadFile(path, fileName)
                        .then((value) => print('Imagen cargada.'));
                  },
                  icon: const Icon(Icons
                      .photo)), //SvgPicture.asset('assets/svg/gallery.svg')

              IconButton(
                  splashRadius: 20,
                  onPressed: () async {
                    Fluttertoast.showToast(msg: "Abriendo camara");
                  },
                  icon: const Icon(Icons.camera_alt)),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Abriendo GIFS");
                  },
                  icon: const Icon(Icons.gif)),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Abriendo maps");
                  },
                  icon: const Icon(Icons.location_on)),
            ],
          ),
          //? agregar vizualizador
        ],
      ),
    );
  }
}
