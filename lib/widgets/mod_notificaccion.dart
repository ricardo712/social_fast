import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/utils/responsive.dart';

class modNotificacion extends StatelessWidget {
  String name;
  String mensaje;
  modNotificacion({Key? key, required this.name, required this.mensaje})
      : assert(name != "" || name != null),
        assert(mensaje != "" || mensaje != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    PubModel pubModel = PubModel();
    Responsive responsive = Responsive(context);
    objeto(pubModel);
    final mensajeNotificacion = "${mensaje} ${name}";
    final fecha = pubModel.fecha;
    final menPub = pubModel.mensaje;

    return Container(
      //color: Colors.deepPurpleAccent,
      padding: EdgeInsets.all(responsive.dp(2)),
      width: responsive.wp(94.3),
      height: responsive.hp(11.6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(
            responsive.dp(7),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: responsive.dp(3),
                backgroundImage: AssetImage('assets/images/a.jpg'),
              ),
            ],
          ),
          SizedBox(
            width: responsive.wp(2),
          ),
          SizedBox(
            width: responsive.wp(60),
            child: Text(
              mensajeNotificacion,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: responsive.dp(2),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
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
