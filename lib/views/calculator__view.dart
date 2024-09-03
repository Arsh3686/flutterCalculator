import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  int x = 0;
  int y = 0;
  dynamic z = 0;

  @override
  void initState() {
    super.initState();
    inputOneController.text = x.toString();
    inputTwoController.text = y.toString();
  }

  final inputOneController = TextEditingController();
  final inputTwoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculatorDisplay(
              hint: "Enter first Number", controller: inputOneController),
          const SizedBox(height: 20.0),
          CalculatorDisplay(
              hint: "Enter second Number", controller: inputTwoController),
          Text(
            z.toString(),
            style: TextStyle(
                color: (z.runtimeType == String
                    ? Colors.red
                    : z > 0
                        ? Colors.green
                        : Colors.black),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (num.tryParse(inputOneController.text) == null ||
                        num.tryParse(inputTwoController.text) == null) {
                      setState(() {
                        z = "Input field can't be empty";
                      });
                    } else {
                      z = num.tryParse(inputOneController.text)! +
                          num.tryParse(inputTwoController.text)!;
                    }
                  });
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (num.tryParse(inputOneController.text) == null ||
                        num.tryParse(inputTwoController.text) == null) {
                      setState(() {
                        z = "Input field can't be empty";
                      });
                    } else {
                      z = num.tryParse(inputOneController.text)! -
                          num.tryParse(inputTwoController.text)!;
                    }
                  });
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (num.tryParse(inputOneController.text) == null ||
                        num.tryParse(inputTwoController.text) == null) {
                      setState(() {
                        z = "Input field can't be empty";
                      });
                    } else {
                      z = num.tryParse(inputOneController.text)! *
                          num.tryParse(inputTwoController.text)!;
                    }
                  });
                },
                child: const Icon(Icons.star),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (num.tryParse(inputOneController.text) == null ||
                        num.tryParse(inputTwoController.text) == null) {
                      setState(() {
                        z = "Input field can't be empty";
                      });
                    } else {
                      z = num.tryParse(inputOneController.text)! /
                          num.tryParse(inputTwoController.text)!;
                    }
                  });
                },
                child: const Icon(Icons.forward),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                inputOneController.clear();
                inputTwoController.clear();
              });
            },
            label: Text("Clear"),
          ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter
            .digitsOnly, // Restricts input to digits only
      ],
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            // color: Colors.black,
            color: Colors.black45,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
