import 'package:flutter/material.dart';
import 'package:mult_calculator/components/components.dart';

class CalculatorRows extends StatelessWidget {
  const CalculatorRows({super.key, required this.buttonPressed});
  final dynamic Function(String bt)? buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CalculatorRow(
            buttonPressed: buttonPressed,
            buttonsText: const ['AC', '(', ')', '/'],
          ),
        ),
        Expanded(
          child: CalculatorRow(
            buttonPressed: buttonPressed,
            buttonsText: const ['7', '8', '9', 'x'],
          ),
        ),
        Expanded(
          child: CalculatorRow(
            buttonPressed: buttonPressed,
            buttonsText: const ['4', '5', '6', '-'],
          ),
        ),
        Expanded(
          child: CalculatorRow(
            buttonPressed: buttonPressed,
            buttonsText: const ['1', '2', '3', '+'],
          ),
        ),
        Expanded(
          child: CalculatorRow(
            buttonPressed: buttonPressed,
            buttonsText: const ['0', ',', '<=', '='],
          ),
        ),
      ],
    );
  }
}

class CalculatorRow extends StatefulWidget {
  CalculatorRow({
    super.key,
    required this.buttonPressed,
    required this.buttonsText,
  });
  final dynamic Function(String bt)? buttonPressed;
  final List buttonsText;

  @override
  State<CalculatorRow> createState() => _CalculatorRowState();
}

class _CalculatorRowState extends State<CalculatorRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CalculatorButton(
          buttonText: widget.buttonsText[0],
          buttonFunc: widget.buttonPressed,
        ),
        CalculatorButton(
          buttonText: widget.buttonsText[1],
          buttonFunc: widget.buttonPressed,
        ),
        CalculatorButton(
          buttonText: widget.buttonsText[2],
          buttonFunc: widget.buttonPressed,
        ),
        CalculatorButton(
          buttonText: widget.buttonsText[3],
          buttonFunc: widget.buttonPressed,
        ),
      ],
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key, this.buttonFunc, required this.buttonText});
  final dynamic Function(String bt)? buttonFunc;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(screenHeight * 0.005),
        height: screenHeight,
        child: CustomButton(
          border: screenHeight * 0.01,
          fontSize: screenHeight * 0.03,
          onPressed: () => buttonFunc!(buttonText),
          child: Text(buttonText),
        ),
      ),
    );
  }
}
