import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {

  final Icon? iconField;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? returnText;


  const TextFieldForm({super.key, 
    this.iconField, 
    required this.hintText, 
    required this.controller, 
    this.keyboardType, 
    this.returnText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8)
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if(value!.isEmpty) return "$returnText";
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            icon: iconField
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}