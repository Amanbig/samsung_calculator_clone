import 'package:flutter/material.dart';
import 'package:calculator_new/components/buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> l = [
    ['C', '( )', '%', '÷'],
    ['7', '8', '9', 'x'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['+/-', '0', '.', '=']
  ];

  String content = '';

  bool isOperator(String s) {
    return s == '+' || s == '-' || s == '%' || s == 'x' || s == '÷';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate button size based on screen width with padding considered
    double buttonSize = (screenWidth - 40) / 4;
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
                  content.toString(),
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
                Icon(Icons.timelapse, color: Colors.white),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: l.map((row) {
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
                                content = '($content)';
                              }
                              else if(ico == '+/-'){
                                if(content[0]=='-'){
                                  content = content.substring(1);
                                }
                                else{
                                  content = '-$content';
                                }
                              }
                              else {
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
          ],
        ),
      ),
    );
  }
}
