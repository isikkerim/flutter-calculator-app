import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:fluttercalculatorapp/widget/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/calculate_controller.dart';
import '../controllers/theme_controller.dart';
import '../helpers/colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // List of calculator button labels
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    // Fetch controllers for calculation and theme management
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        // AppBar with a custom theme switcher
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GetBuilder<ThemeController>(builder: (controller) {
                return AdvancedSwitch(
                  controller: controller.switcherController,
                  // Switch controller
                  activeImage: const AssetImage('assets/day_sky.png'),
                  // Day mode icon
                  inactiveImage: const AssetImage('assets/night_sky.jpg'),
                  // Night mode icon
                  activeColor: Colors.green,
                  // Active switch color
                  inactiveColor: Colors.grey,
                  // Inactive switch color
                  activeChild: Text(
                    // Text for day mode
                    'Day',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  inactiveChild: Text(
                    // Text for night mode
                    'Night',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                  // Circular switch
                  width: 100.0,
                  height: 45.0,
                  enabled: true,
                  disabledOpacity: 0.5, // Opacity when disabled
                );
              }),
            ),
          ],
          // AppBar background color based on theme
          backgroundColor: themeController.isDark
              ? DarkColors.scaffoldBgColor
              : LightColors.scaffoldBgColor,
        ),
        // Scaffold background color based on theme
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(
          children: [
            // Output section showing user input and result
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themeController, controller);
            }),
            // Input section containing calculator buttons
            inPutSection(themeController, controller),
          ],
        ),
      );
    });
  }

  /// Input Section - Buttons layout for user interaction
  Widget inPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              // Background color and rounded corners based on theme
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // Fixed grid layout
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              // 4 columns in grid
              itemBuilder: (context, index) {
                switch (index) {
                  // CLEAR button
                  case 0:
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.clearInputAndOutput();
                      },
                      color: themeController.isDark
                          ? DarkColors.leftOperatorColor
                          : LightColors.leftOperatorColor,
                      textColor: themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                      text: buttons[index],
                    );

                  // DELETE button
                  case 1:
                    return CustomAppButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        text: buttons[index]);

                  // EQUAL button
                  case 19:
                    return CustomAppButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        textColor: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        text: buttons[index]);

                  // Default buttons
                  default:
                    return CustomAppButton(
                      buttonTapped: () {
                        controller.onBtnTapped(buttons, index);
                      },
                      // Operators styled differently from numbers
                      color: isOperator(buttons[index])
                          ? LightColors.operatorColor
                          : themeController.isDark
                              ? DarkColors.btnBgColor
                              : LightColors.btnBgColor,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : themeController.isDark
                              ? Colors.white
                              : Colors.black,
                      text: buttons[index],
                    );
                }
              }),
        ));
  }

  /// Output Section - Displays user input and calculation results
  /// Output Section - Displays user input and calculation results
  Widget outPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // User input display
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 70),
            child: Column(
              children: [
                // Display the user's input
                Container(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    // Allow horizontal scrolling
                    child: Text(
                      controller.userInput,
                      style: GoogleFonts.ubuntu(
                        color: themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 38,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text overflows
                    ),
                  ),
                ),
                // Display the result of the calculation
                Container(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    // Allow horizontal scrolling
                    child: Text(
                      controller.userOutput,
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        color: themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 60,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text overflows
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  /// Check if a button is an operator
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
