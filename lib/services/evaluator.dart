import 'dart:math';
import 'package:expressions/expressions.dart';

class CustomEvaluator extends ExpressionEvaluator {
  const CustomEvaluator();

  @override
  dynamic evalFunction(String functionName, List<dynamic> arguments) {
    switch (functionName) {
      case 'sqrt':
        return sqrt(arguments[0]);
      case 'sin':
        return sin(arguments[0] * (pi / 180)); // Convert degrees to radians
      case 'cos':
        return cos(arguments[0] * (pi / 180)); // Convert degrees to radians
      case 'tan':
        return tan(arguments[0] * (pi / 180)); // Convert degrees to radians
      case 'ln':
        return log(arguments[0]);
      case 'log':
        return log(arguments[0]) / log(10); // Log base 10
      case 'abs':
        return arguments[0].abs();
      case 'pow':
        return pow(arguments[0], arguments[1]);
      default:
        throw UnimplementedError('Function $functionName is not implemented.');
    }
  }

  @override
  dynamic evalVariable(Variable variable, Map<String, dynamic> context) {
    final variableName = variable.identifier.name;
    switch (variableName) {
      case 'pi':
        return pi;
      case 'e':
        return e;
      default:
        throw UnimplementedError('Variable $variableName is not implemented.');
    }
  }

  @override
  dynamic evalCallExpression(
      CallExpression expression, Map<String, dynamic> context) {
    var functionName = expression.callee is Variable
        ? (expression.callee as Variable).identifier.name
        : expression.callee.toString();

    var arguments = expression.arguments.map((e) => eval(e, context)).toList();

    return evalFunction(functionName, arguments);
  }

  @override
  dynamic evalBinaryExpression(
      BinaryExpression expression, Map<String, dynamic> context) {
    var left = eval(expression.left, context);
    var right = eval(expression.right, context);

    switch (expression.operator) {
      case '**':  // Map '**' to pow function
        return pow(left, right);
      case '+':
        return left + right;
      case '-':
        return left - right;
      case '*':
        return left * right;
      case '/':
        return left / right;
      case '%':
        return left % right;
    // Add more cases as needed
      default:
        throw ArgumentError('Unknown operator ${expression.operator} in expression');
    }
  }

  dynamic evaluateExpression(Expression expression) {
    return eval(expression, {});
  }
}
