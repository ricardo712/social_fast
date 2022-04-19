import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({Key? key, required this.size})
      : assert(size != null && size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      //color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(this.size * 0.2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 25,
            offset: Offset(0, 15),
          ),
        ],
      ),
      padding: EdgeInsets.all(this.size * 0.15),
      child: Center(
          child: CircleAvatar(
        child: SvgPicture.asset(
          'assets/svg/mobile-new-posts.svg',
          width: double.infinity,
          height: double.infinity,
        ),
        radius: 100,
        backgroundColor: Colors.white60,
      )),
    );
  }
}
