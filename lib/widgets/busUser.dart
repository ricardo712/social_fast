import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/utils/responsive.dart';

class busUser extends StatelessWidget {
  String nameUser;
  busUser({Key? key, required this.nameUser})
      : assert(nameUser != null || nameUser != ""),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: responsive.wp(1.5),
        ),
        Container(
          //alignment: Alignment.bottomLeft,
          height: responsive.hp(7),
          //color: Colors.amber,
          width: responsive.wp(14), //size.width * .125,
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/img/pru1.jpeg'),
          ),
        ),
        SizedBox(
          width: responsive.wp(1.5),
        ),
        SizedBox(
          width: responsive.wp(60),
          child: Text(
            nameUser,
            style: TextStyle(
              fontSize: responsive.wp(5),
              //backgroundColor: Colors.amber,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Fluttertoast.showToast(msg: "Eliminando...");
          },
          icon: const Icon(Icons.close),
          iconSize: responsive.dp(3),
        )
      ],
    );
  }
}
