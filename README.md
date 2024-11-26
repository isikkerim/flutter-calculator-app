# Flutter Calculator App

This project is a simple and functional **Calculator App** built using **Flutter** and **GetX**. It supports basic arithmetic operations and has a clean, intuitive UI with dark and light theme options. The app demonstrates the usage of state management, button handling, and math expression parsing.

---

## ✨ Features

- **Basic Arithmetic Operations**: Addition, subtraction, multiplication, division, and modulus.
- **Dark and Light Themes**: Toggle themes using a custom switch.
- **Responsive UI**: Adaptive layout for different screen sizes.
- **Real-Time Updates**: Powered by GetX for state management.

---

## 🚀 Technologies Used

- **Flutter**
- **Dart**
- **GetX**: State management and navigation.
- **Math Expressions**: Parsing and evaluating mathematical expressions.
- **Google Fonts**: Custom fonts for a sleek design.

---

## 📂 Contents

1. **`ThemeController`**:
    - Manages dark and light themes.
    - Uses `ValueNotifier` for real-time theme switching.
    - Handles system UI overlay changes.

2. **`CalculateController`**:
    - Handles user input and output for calculations.
    - Implements core calculator functions like clear, delete, and evaluate.
    - Parses and evaluates math expressions with the `math_expressions` package.

3. **UI Widgets**:
    - Customizable buttons for numbers and operations.
    - Switch component for toggling themes.
    - GridView layout for calculator buttons.

---

## 🖥️ How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/isikkerim/flutter-calculator-app.git
