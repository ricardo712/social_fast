import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:social_fast/screens/buscar.dart';
import 'package:social_fast/screens/home_screen.dart';
import 'package:social_fast/screens/infoPersonal.dart';
import 'package:social_fast/screens/perfilCompleto.dart';
import 'package:social_fast/screens/notificaciones.dart';
import 'package:social_fast/screens/view_pub.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/views/perfil.dart';
import 'package:social_fast/views/publica.dart';

class raiz extends StatefulWidget {
  raiz({Key? key}) : super(key: key);

  @override
  State<raiz> createState() => _raizState();
}

class _raizState extends State<raiz> {
  int _page = 0;
  //moverse entre las páginas.
  final perfilCompleto _perfil = const perfilCompleto();
  final publicacionPerfil _pubPerfil = const publicacionPerfil();
  final Perfil _perfilBotton = const Perfil();
  final HomeSreen _homeScreen = const HomeSreen();
  final Notificaciones _notificaciones = Notificaciones();
  final viewPub _viewpub = const viewPub();
  final buscarUser _buscarUser = new buscarUser();

  Widget _showPage = new HomeSreen();
  Widget _pageChoser(int page) {
    switch (page) {
      case 0:
        return _homeScreen;

      case 1:
        return _notificaciones;

      case 2:
        return _viewpub;

      case 3:
        return _pubPerfil;

      case 4:
        return _perfil;

      default:
        return const Center(
          child: Text(
            'No se encontro la pagina. ',
            style: TextStyle(fontSize: 30),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.favorite,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ),
      const Icon(
        Icons.person,
        size: 30,
        color: Colors.white,
      ),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white24,
          //buttonBackgroundColor: Colors.black,
          color: Colors.pink,
          height: resposive.hp(6),
          index: _page,
          items: items,
          onTap: (int tappedIndex) {
            setState(() {
              //print(tappedIndex);
              _showPage = _pageChoser(tappedIndex);
            });
          }),
      body: Container(
        color: Colors.white10,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
