import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_fast/services/storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/services/uploadImage.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:dio/dio.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:social_fast/widgets/input_comen.dart';

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
        prefixIcon: const Icon(Icons.add_comment),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Agregar publicacion.",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    return Column(
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
                auth.requesUpdateImage(_image!, publicacionController.text, "");

                Fluttertoast.showToast(
                    msg:
                        "Agregando publicación. " + publicacionController.text);
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

                  _openGallery(context);

                  // final results = await FilePicker.platform.pickFiles(
                  //   allowMultiple: false,
                  //   type: FileType.custom,
                  //   allowedExtensions: ['png', 'jpg'],
                  // );
                  // if (results == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text("No hay archivos seleccionados."),
                  //     ),
                  //   );
                  //   return;
                  // }
                  // final path = results.files.single.path!;
                  // final fileName = results.files.single.name;
                  // print(path);
                  // print(fileName);

                  // uploadImage();
                  // storage //?Carga de imagen a firebase
                  //        .uploadFile(path, fileName)
                  //        .then((value) => print('Imagen cargada.'));
                },
                icon: const Icon(
                    Icons.photo)), //SvgPicture.asset('assets/svg/gallery.svg')

            IconButton(
                splashRadius: 20,
                onPressed: () async {
                  Fluttertoast.showToast(msg: "Abriendo camara");
                  _openCamera(context);
                },
                icon: const Icon(Icons.camera_alt)),
            // IconButton(
            //     splashRadius: 20,
            //     onPressed: () {
            //       Fluttertoast.showToast(msg: "Abriendo GIFS");
            //     },
            //     icon: const Icon(Icons.gif)),
            // IconButton(
            //     splashRadius: 20,
            //     onPressed: () {
            //       Fluttertoast.showToast(msg: "Abriendo maps");
            //     },
            //     icon: const Icon(Icons.location_on)),
          ],
        ),
        //? agregar vizualizador
        _image != null
            ? CircleAvatar(
                backgroundImage: FileImage(_image!),
                radius: 75.0,
              )
            : Container()
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
    } catch (e) {}
  }
}
