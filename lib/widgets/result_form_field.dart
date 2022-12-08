import 'package:flutter/material.dart';

class ResultFormField extends StatelessWidget {

  final double? sizeheigthContain;
  final double? sizeText;
  final String textField;

  const ResultFormField({super.key, 
    required this.textField, 
    this.sizeheigthContain, 
    this.sizeText, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeheigthContain,
      width: 210,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.yellow]
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Text(
          textField,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sizeText,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}