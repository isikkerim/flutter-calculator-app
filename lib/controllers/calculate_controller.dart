import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
  // Variables to store user input and output
  var userInput = ""; // Stores what the user enters on the calculator
  var userOutput = ""; // Stores the result of the calculation

  /// Handles the "=" button functionality
  equalPressed() {
    String userInputFC = userInput; // Copy user input for further processing
    userInputFC = userInputFC.replaceAll("x", "*"); // Replace 'x' with '*' for math expression parsing

    // Create a parser to evaluate the mathematical expression
    Parser p = Parser();
    Expression exp = p.parse(userInputFC); // Parse the input string
    ContextModel ctx = ContextModel(); // Context model for variable support
    double eval = exp.evaluate(EvaluationType.REAL, ctx); // Evaluate the expression

    userOutput = eval.toString(); // Convert result to string and store in userOutput
    update(); // Notify listeners to rebuild the UI
  }

  /// Handles the "C" button functionality (clear input and output)
  clearInputAndOutput() {
    userInput = ""; // Clear user input
    userOutput = ""; // Clear user output
    update(); // Notify listeners to rebuild the UI
  }

  /// Handles the "DEL" button functionality (delete the last character)
  deleteBtnAction() {
    // Remove the last character from user input
    userInput = userInput.substring(0, userInput.length - 1);
    update(); // Notify listeners to rebuild the UI
  }

  /// Appends the tapped button value to the user input
  onBtnTapped(List<String> buttons, int index) {
    userInput += buttons[index]; // Add the tapped button's value to userInput
    update(); // Notify listeners to rebuild the UI
  }
}
