import 'package:flutter/material.dart';

class InputComent extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText, borderEnable;

  const InputComent({
    Key? key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      decoration: InputDecoration(
        border: this.borderEnable ? null : InputBorder.none,
        labelText: this.label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
