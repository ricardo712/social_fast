import 'package:flutter/material.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/widgets/busUser.dart';
import 'package:social_fast/widgets/circle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class buscarUser extends StatelessWidget {
  const buscarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final double pinkSize = responsive.wp(90);
    final double orangeSize = responsive.wp(55);

    Row userResult = Row(
      children: [
        Container(
          //alignment: Alignment.bottomLeft,
          height: responsive.hp(7),
          //color: Colors.amber,
          width: responsive.wp(16), //size.width * .125,
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/img/pru1.jpeg'),
          ),
        ),
        SizedBox(
          width: responsive.wp(1),
        ),
        SizedBox(
          width: responsive.wp(63),
          child: Text(
            "Ricardo Andres Carvajal Arenas",
            style: TextStyle(
              fontSize: responsive.wp(5),
              //backgroundColor: Colors.amber,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
          iconSize: responsive.dp(3),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscar',
          style: TextStyle(fontSize: responsive.dp(3)),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: responsive.height * 0.82,
        child: Stack(
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
              padding: EdgeInsets.all(responsive.dp(1.5)),
              children: <Widget>[
                Wrap(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: responsive.dp(1),
                          horizontal: responsive.dp(1)),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: responsive.hp(7),
                                //color: Colors.amber,
                                width: responsive.wp(16), //size.width * .125,
                                child: const CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage('assets/img/pru1.jpeg'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: responsive.hp(7),
                            width: responsive.wp(72.5),
                            //color: Colors.grey.shade300, //parte de perfil
                            child: TextFormField(
                              style: TextStyle(fontSize: responsive.dp(2.2)),
                              //controller: _comentarioController,
                              //maxLines: 3,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.only(left: 15.0, top: 30),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        responsive.dp(15))),
                                hintText: 'Buscar personas...',
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 18,
                                ),
                                suffixIcon: IconButton(
                                  //color: Colors.amber,
                                  iconSize: responsive.dp(3),
                                  icon: const Icon(Icons.search),
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: 'Buscando',
                                    );
                                  },
                                ),
                              ),
                              validator: RequiredValidator(
                                  errorText: 'El campo es obligatorio'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          responsive.wp(5), responsive.hp(1), 0, 0),
                      child: Text(
                        'Busquedas recientes.',
                        style: TextStyle(
                          fontSize: responsive.dp(2.4),
                        ),
                      ),
                    )
                  ],
                ),
                //?
                Container(
                  width: responsive.wp(98),
                  height: responsive.hp(65),
                  //color: Colors.black12,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:
                          BorderRadius.all(Radius.circular(responsive.dp(2)))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: responsive.dp(1)),
                    child: Column(
                      children: [
                        //userResult,
                        busUser(nameUser: "Ricardo Andres Carvajal Arenas")
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
