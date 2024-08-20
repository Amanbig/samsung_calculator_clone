# Calculator App

Calculator App is a modern and versatile calculator built with Flutter, designed to handle both basic and advanced mathematical operations. The app features a user-friendly interface with support for scientific functions, power operations, and special constants.

<div align="center">
  <img src="https://github.com/Amanbig/samsung_calculator_clone/blob/main/images/image2.png" alt="Home Screen" width="200"/>
  <img src="https://github.com/Amanbig/samsung_calculator_clone/blob/main/images/image1.png" alt="Landscape Mode" width="200"/>
</div>

## Features

- **Basic Arithmetic**: Perform addition, subtraction, multiplication, and division.
- **Scientific Functions**: Calculate square roots, trigonometric functions, natural logarithms, and logarithms base 10.
- **Power Operations**: Use exponentiation for squaring numbers and custom power functions.
- **Parentheses**: Control the order of operations with parentheses.
- **Special Constants**: Utilize π (pi) and e in calculations.
- **Dynamic UI**: Automatically adjusts button sizes and layout based on device orientation.
- **Error Handling**: Displays error messages for invalid expressions.

## Installation

To set up and run the Calculator App, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Amanbig/samsung_calculator_clone.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd calculator_new
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

## Usage

After installing the app, you can:

- **Perform Basic Operations**: Use numeric buttons and operators (`+`, `-`, `x`, `÷`) for simple arithmetic.
- **Use Scientific Functions**: Access functions like `sin`, `cos`, `tan`, `sqrt`, `log`, etc., from the function buttons.
- **Apply Power Functions**: Calculate powers using `x^2` for squaring and `x^y` for general exponentiation.
- **Utilize Parentheses**: Group expressions with parentheses `( )` to manage the order of operations.
- **Insert Special Constants**: Use π (pi) and e with dedicated buttons.

## Code Overview

- **`lib/screens/home_screen.dart`**: Contains the main screen of the calculator with button layout and functionality.
- **`lib/services/evaluator.dart`**: Implements the `CustomEvaluator` class for evaluating complex mathematical expressions.
- **`lib/components/buttons.dart`**: Provides reusable UI components for calculator buttons.

## Contributing

If you would like to contribute to this project, please fork the repository and create a pull request with your changes.
