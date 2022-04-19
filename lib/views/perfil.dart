import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/main.dart';
import 'package:social_fast/ui/widgets.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Usuario'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    onPressed: () {
                      print('Agregar publicacion');
                      Navigator.pushNamed(context, "/publicacion");
                      //Fluttertoast.showToast(msg: 'Agregar publicación');
                    },
                    child: const TextFrave(
                      text: 'Agregar publicacion',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5,
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    onPressed: () {
                      print('Agregar Comentario');
                      Navigator.pushNamed(context, "/comentario");
                      //Fluttertoast.showToast(msg: 'Agregar comentario');
                    },
                    child: const TextFrave(
                      text: 'Comentario',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
