import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:mult_calculator/components/calculator_components.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '';
  String output = '';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void buttonPressed(String buttonText) {
      setState(
        () {
          if (buttonText == 'AC') {
            input = '';
            output = '';
          } else if (buttonText == '<=') {
            if (input != '') {
              input = input.substring(0, input.length - 1);
            }
          } else if (buttonText == '=') {
            try {
              output = input;
              input = input.replaceAll('x', '*');
              input = input.replaceAll(',', '.');

              Parser p = Parser();
              Expression expression = p.parse(input);
              input = expression
                  .evaluate(EvaluationType.REAL, ContextModel())
                  .toString()
                  .replaceAll('.', ',');
            } catch (e) {
              output = 'Invalid Expression!';
            }
          } else {
            input = input + buttonText;
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Calculator')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(screenWidth * 0.01),
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.006),
                      child: Text(
                        input,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: screenHeight * 0.06,
                            color: Theme.of(context).colorScheme.primary,
                            letterSpacing: screenWidth * 0.005),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.002),
                      child: Text(
                        output,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: screenHeight * 0.04,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: CalculatorRows(
                buttonPressed: buttonPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
