import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:social_fast/widgets/mod_publicacion.dart';
import 'package:social_fast/widgets/icon_container.dart';

class viewPub extends StatefulWidget {
  const viewPub({Key? key}) : super(key: key);

  @override
  State<viewPub> createState() => _viewPubState();
}

class _viewPubState extends State<viewPub> {
  //File? imagen = null;
  //final picker = ImagePicker();
/*
  Future selimagen(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      print('Abriendo foto');
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print("No hay imagen selecionada");
      }
    });
    Navigator.of(context).pop();
  }*/
  PubModel pubModel = PubModel();

  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final double pinkSize = resposive.wp(90);
    final double orangeSize = resposive.wp(55);
    objeto(pubModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicaciones'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: resposive.height * 0.82,
          color: Colors.white,
          child: Stack(
            //alignment: Alignment.center,
            children: <Widget>[
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
                padding: EdgeInsets.all(resposive.dp(1.5)),
                children: <Widget>[
                  modPublicacion(
                    pubModel: pubModel,
                  ),
                  SizedBox(
                    height: resposive.hp(1),
                  ),
                  modPublicacion(
                    pubModel: pubModel,
                  ),
                ],
              )
              //?
            ],
          ),
        ),
      ),
    );
  }

  void objeto(PubModel pubModel) {
    pubModel.id = '1';
    pubModel.uid = '1058';
    pubModel.uName = 'Jhon Ruiz';
    pubModel.mensaje = 'Un buen paisaje.';
    pubModel.fecha = '07/04/2022';
    pubModel.hora = '16:36';
    pubModel.imagen = 'vacio';
  }
}
