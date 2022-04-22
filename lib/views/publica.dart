import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_fast/models/user_model.dart';
import 'package:social_fast/services/storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_fast/ui/widgets.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:image_picker/image_picker.dart';

class publicacionPerfil extends StatefulWidget {
  const publicacionPerfil({Key? key}) : super(key: key);

  @override
  State<publicacionPerfil> createState() => _publicacionPerfilState();
}

class _publicacionPerfilState extends State<publicacionPerfil> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final String title = 'Publicación';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Storage storage = Storage();
  late final bool _success = false;
  late String userMail;

  final _keyForm = GlobalKey<FormState>();
  late List<AssetEntity> _mediaList = [];
  int privacidad = 1;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Future agrImagen() async {
    //final Storage storage = Storage();
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
      return null;
    }
    final path = results.files.single.path!;
    final fileName = results.files.single.name;
    setState(() {
      //sampleImage = results;
    });
    print(path);
    print(fileName);
    storage
        .uploadFile(path, fileName)
        .then((value) => print('Imagen cargada.'));
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    final size = MediaQuery.of(context).size;
    File _selecImage;

    //int _count = 0;
    //String srcImage;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Column(
            children: [
              SizedBox(
                height: responsive.hp(6.8),
                width: responsive.wp(100),
                child: _appBarPost(context),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(responsive.dp(1)),
            child: Column(
              children: [
                //const SizedBox(height: 10.0),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              //color: Colors.amber,
                              //padding: const EdgeInsets.symmetric(vertical: 40),
                              alignment: Alignment.center,
                              height: responsive.hp(10),
                              width: size.width * .19,
                              child: CircleAvatar(
                                radius: responsive.dp(4.15), //39
                                backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf0ERpjDSStCmhswKfKo13q_LtBlg72b-H1qDCyoQtUHgzhCpVEhM9Ld5aumNAZ3PbRkc&usqp=CAU',
                                  scale: responsive.dp(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: responsive.hp(14),
                              width: responsive.wp(75),
                              //color: Colors.grey.shade300, //parte de perfil
                              child: TextFormField(
                                style: TextStyle(fontSize: responsive.dp(2.5)),
                                //controller: _comentarioController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 10.0, top: 40.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            responsive.dp(2.5))),
                                    hintText: 'Agrega un comentario...',
                                    hintStyle:
                                        GoogleFonts.roboto(fontSize: 18)),
                                validator: RequiredValidator(
                                    errorText: 'El campo es obligatorio'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: responsive.hp(1.1),
                        ),
                        // if (_selecImage != null)
                        //   SizedBox(
                        //     height: 100,
                        //     child: Image.file(_selecImage),
                        //   ),
                        /*Padding(
                          //? reemplazar por la imagen de galeria
                          padding:
                              const EdgeInsets.only(left: 65.0, right: 10.0),
                          child: Container(
                            height: 150,
                            width: size.width * .95,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://st2.depositphotos.com/1852625/5395/i/600/depositphotos_53954927-stock-photo-beautiful-landscape-of-scottish-nature.jpg') //imagen para mostrar
                                  ),
                            ),
                          ), //Text('Linea 140 a 186'),
                        ),*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.all(responsive.wp(1)),
                  height: responsive.hp(12),
                  width: size.width,
                  color: Colors.grey.shade300,

                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //color: Colors.black,
                            height: 55,
                            width: size.width * .2,
                            margin: const EdgeInsets.only(
                              bottom: 3.0,
                              left: 3.0,
                              top: 3.0,
                              right: 3.0,
                            ),
                            child: Image.network(
                              'https://st.depositphotos.com/1003352/2263/i/600/depositphotos_22635647-stock-photo-mountain-lake.jpg',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 55,
                            width: size.width * .2,
                            margin: const EdgeInsets.only(
                              bottom: 3.0,
                              left: 3.0,
                              top: 3.0,
                              right: 3.0,
                            ),
                            child: Image.network(
                              'https://st.depositphotos.com/1003352/2263/i/600/depositphotos_22635647-stock-photo-mountain-lake.jpg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), // ? ListView.builder
                ),
                const SizedBox(height: 5.0),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    opciones(context);
                  },
                  child: InkWell(
                    //onTap: () => ,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          //? seleccion de privacidad
                          if (privacidad == 1) const Icon(Icons.public_rounded),
                          if (privacidad == 2)
                            const Icon(Icons.public_outlined),
                          if (privacidad == 3)
                            const Icon(Icons.lock_outline_rounded),
                          const SizedBox(),
                          //ahora mostramos el mensaje
                          const SizedBox(width: 5.0),
                          if (privacidad == 1)
                            const Text.rich(
                                TextSpan(text: 'Todos pueden comentar')),
                          if (privacidad == 2)
                            const Text.rich(TextSpan(text: 'Solo amigos')),
                          if (privacidad == 3)
                            const Text.rich(TextSpan(text: 'Solo yo')),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                //const Divider(),
                const SizedBox(height: 5.0),
                SizedBox(
                  height: responsive.hp(5),
                  width: responsive.wp(47), //linea 266
                  //child: Icon(Icons.add_a_photo),
                  child: Row(
                    children: [
                      IconButton(
                          splashRadius: 20,
                          onPressed: () async {
                            const Text.rich(TextSpan(
                                text: 'Permiso para acceder a galeria'));
                            Fluttertoast.showToast(msg: "Abriendo galeria");
                            //? agregar imagen
                            agrImagen();
                          },
                          icon: const Icon(Icons.camera)),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () async {
                            const Text.rich(TextSpan(
                                text: 'Permiso para acceder a camara'));
                          },
                          icon: const Icon(Icons.add_a_photo)),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.gif)),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.location_on)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  opciones(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    privacidad = 1;
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Todos pueden comentar.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.public_rounded,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    privacidad = 2;
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Solo amigos.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.person_pin_rounded,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    privacidad = 3;
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Solo yo.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.lock,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _register() async {
    /*final FirebaseAuth user = (await _auth.createUserWithEmailAndPassword(
        email: _comentarioController.text,
        password: _comentarioController.text)) as FirebaseAuth;
    if (user != null) {
      //setState
    } else {}*/
  }

  Widget _appBarPost(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.of(context).pop();
            }, //=> Navigator.pushAndRemoveUntil(
            // 'context', routeSlide(page: ejemplo1()), (_) => false),

            icon: const Icon(Icons.arrow_back)),
        TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          onPressed: () {},
          child: const TextFrave(
            text: 'Publicar',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 5,
          ),
        ),
        //TextButton(onPressed: () {}, child: const Text('Hola'))
      ],
    );
  }
}
