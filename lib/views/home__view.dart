import 'package:codepur/views/calculator__view.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        top: false,
        bottom: false,
        child: CalculatorHomePage(),
      ),
    );
  }
}
