import 'package:flutter/material.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/views/publica.dart';

class modPublicacion extends StatelessWidget {
  PubModel pubModel = PubModel();
  modPublicacion({Key? key, required this.pubModel})
      : assert(pubModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final userName = pubModel.uName;
    final fecha = pubModel.fecha;
    final menPub = pubModel.mensaje;
    final size = MediaQuery.of(context).size;

    return Container(
      //color: Colors.deepPurpleAccent,
      padding: EdgeInsets.all(resposive.dp(2)),
      width: resposive.wp(94.3),
      height: resposive.hp(67),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(
            resposive.dp(7),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                radius: resposive.dp(4),
                backgroundImage: AssetImage('assets/images/a.jpg'),
              ),
              SizedBox(
                width: resposive.wp(2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        userName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resposive.dp(3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        fecha!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resposive.dp(1.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.public),
                    ],
                  ),
                ],
              ),
            ],
          ),
          //?Parte de la Imagen ↓
          SizedBox(
            height: resposive.hp(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                menPub!,
                style: TextStyle(fontSize: resposive.dp(1.9)),
              ),
            ],
          ),
          SizedBox(
            height: resposive.hp(1),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(
                Radius.circular(resposive.dp(7)),
              ),
            ),
            width: resposive.wp(90),
            height: resposive.hp(41),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                    child: Container(
                      //height: resposive.hp(48),
                      //width: resposive.wp(84.6),
                      //margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(resposive.dp(7)),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://st2.depositphotos.com/1852625/5395/i/600/depositphotos_53954927-stock-photo-beautiful-landscape-of-scottish-nature.jpg') //imagen para mostrar
                            ),
                      ),
                    ), //Text('Linea 140 a 186'),
                  ),
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite, color: Colors.white,), ),
          IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const publicacionPerfil())), icon: const Icon(Icons.comment, color: Colors.white,) ),
          ],)
        ],
      ),
    );
  }
}
