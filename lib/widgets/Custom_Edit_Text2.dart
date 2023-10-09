
import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {

  late final String text;
  late final TextEditingController controller;
  Function(String) onchanged;
  TextInputType? inputType;
  CustomTextField2 ({super.key,required this.text,required this.controller,required this.onchanged,required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      keyboardType: inputType,
      controller:controller,
      decoration: InputDecoration(
        constraints: const BoxConstraints(
          maxHeight: 53.7,
          minHeight: 53.7,
          maxWidth: double.infinity,
          minWidth: 360,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),

        labelText: text,
        floatingLabelStyle: const TextStyle(
          height: 3.7,),
        filled: true,
        fillColor: Colors.grey[200],
      ),


    );
  }
}