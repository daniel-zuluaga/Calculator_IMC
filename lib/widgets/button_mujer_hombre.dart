import 'package:flutter/material.dart';

class ButtonMujerHombre extends StatelessWidget {

  final String textButton;
  final Color? colorButton;

  const ButtonMujerHombre({super.key, 
    required this.textButton, 
    this.colorButton
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, color: Colors.black),
            Text(
              textButton,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}