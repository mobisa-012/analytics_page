import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FitnessButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onTap;
  
  const FitnessButton({super.key, required this.title,  this.isEnabled = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 50,
      decoration: BoxDecoration(
        color: isEnabled? Colors.blueAccent: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
