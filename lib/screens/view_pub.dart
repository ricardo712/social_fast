import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/views/form_publicar.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:social_fast/widgets/mod_publicacion.dart';

class viewPub extends StatefulWidget {
  const viewPub({Key? key}) : super(key: key);

  @override
  State<viewPub> createState() => _viewPubState();
}

class _viewPubState extends State<viewPub> {
  PubModel pubModel = PubModel();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);
    objeto(pubModel);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Publicaciones',
          style: TextStyle(fontSize: responsive.dp(3), color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: responsive.height * 0.82,
          color: Colors.white,
          child: Stack(
            //alignment: Alignment.center,
            children: <Widget>[
              Column(
                children: [
                  modPublicacion(
                    pubModel: pubModel,
                  ),
                ],
              ),

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
