import 'package:calculator_new/services/evaluator.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:calculator_new/components/buttons.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPortrait = true;

  @override
  void initState() {
    super.initState();
  }

  List<List<String>> l = [
    ['C', '( )', '%', '÷'],
    ['7', '8', '9', 'x'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['+/-', '0', '.', '=']
  ];

  List<List<String>> f = [
    ['⇄', 'Rad', '√', 'C', '( )', '%', '÷'],
    ['sin', 'cos', 'tan', '7', '8', '9', 'x'],
    ['ln', 'log', '1/x', '4', '5', '6', '-'],
    ['e^x', 'x^2', 'x^y', '1', '2', '3', '+'],
    ['|x|', '∏', 'e', '+/-', '0', '.', '=']
  ];

  String evaluateExpression(String expressionString) {
    Expression expression = Expression.parse(expressionString);
    final evaluator = CustomEvaluator();
    try {
      var result = evaluator.evaluateExpression(expression);
      return result.toString();
    } catch (e) {
      print('Error evaluating expression: $e');
      return "Error";
    }
  }

  String content = '';

  bool isOperator(String s) {
    return s == '+' || s == '-' || s == '%' || s == 'x' || s == '÷';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust button size based on orientation
    double buttonSize = isPortrait
        ? (screenWidth - 40) / 4
        : (screenWidth - 40) / 10;

    double minButtonSize = 60.0; // Minimum size for the buttons
    if (buttonSize < minButtonSize) {
      buttonSize = minButtonSize;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth - 20, // 10 padding on each side
                height: (screenHeight - 40) * 28 / 100,
                alignment: Alignment.bottomRight,
                child: Text(
                  content,
                  style: TextStyle(
                    color: isOperator(content) ? Colors.green : Colors.grey[500],
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.timelapse, color: Colors.white),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.rulerHorizontal,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (isPortrait) {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeLeft,
                            DeviceOrientation.landscapeRight,
                          ]);
                        } else {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                          ]);
                        }
                        setState(() {
                          isPortrait = !isPortrait;
                        });
                      },
                      icon: Icon(
                        FontAwesomeIcons.calculator,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (content.isNotEmpty) {
                        content = content.substring(0, content.length - 1);
                      }
                    });
                  },
                  icon: Icon(Icons.backspace, color: Colors.white),
                ),
              ],
            ),
            Divider(color: Colors.grey[700]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Add padding
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (isPortrait ? l : f).map((row) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: row.map((ico) {
                          return Buttons(
                            width: buttonSize,
                            height: buttonSize,
                            ico: ico,
                            colors: Colors.grey[900],
                            onClick: () {
                              setState(() {
                                if (ico == 'C') {
                                  content = '';
                                } else if (ico == '( )') {
                                  int openCount = content.split('(').length - 1;
                                  int closeCount = content.split(')').length - 1;
                                  if (openCount > closeCount) {
                                    content += ')';
                                  } else {
                                    content += '(';
                                  }
                                } else if (ico == '+/-') {
                                  if (content.isNotEmpty && content[0] == '-') {
                                    content = content.substring(1);
                                  } else {
                                    content = '-$content';
                                  }
                                } else if (ico == '=') {
                                  try {
                                    content = content
                                        .replaceAll("x", "*")
                                        .replaceAll("÷", "/")
                                        .replaceAll("√", "sqrt");

                                    content = evaluateExpression(content);
                                  } catch (e) {
                                    content = "Error";
                                  }
                                } else if (ico == '√') {
                                  content = "sqrt($content)";
                                } else if (ico == '^') {
                                  content += "^";
                                } else if (ico == 'sin') {
                                  content = "sin($content)";
                                } else if (ico == 'cos') {
                                  content = "cos($content)";
                                } else if (ico == 'tan') {
                                  content = "tan($content)";
                                } else if (ico == 'ln') {
                                  content = "ln($content)";
                                } else if (ico == 'log') {
                                  content = "log($content)";
                                } else if (ico == '1/x') {
                                  content = "1/($content)";
                                } else if (ico == 'e^x') {
                                  content = "pow(e, $content)";  // Convert e^x to pow(e, x)
                                } else if (ico == 'x^2') {
                                  content = "pow($content, 2)";
                                } else if (ico == 'x^y') {
                                  content += "^";
                                } else if (ico == '|x|') {
                                  content = "abs($content)";
                                } else if (ico == '∏') {
                                  content += "pi";
                                } else if (ico == 'e') {
                                  content += "e";
                                } else {
                                  content += ico;
                                }
                              });
                            },
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
