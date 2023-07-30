import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sha_alert/button.dart';

class ShaAlert {
  static showHozzoAlert(
    //* Required parameters
    //* This context should contain navigator for the alert to work properly and pop itself.
    BuildContext context, {
    required String title,
    required String message,
    required String firstButtonTitle,

    //* Second button title, if not provided, only one button will be shown
    String? secondButtonTitle,

    //* Function to be called when first button is pressed
    Function? onFirstButtonPressed,

    //* Function to be called when second button is pressed
    Function? onSecondButtonPressed,
    ButtonType firstButtonType = ButtonType.negative,
    ButtonType secondButtonType = ButtonType.secondary,

    //* Height of the alert dialog, default is 270 pixels.
    double height = 280,

    //* Use this for showing custom widgets or even loti or images, but don't forget to set height accordingly
    Widget? child,

    //* Backdrop color, default is black54 (black with 54% opacity)
    Color backdropColor = Colors.black54,

    //* Default transition duration is 120 milliseconds (0.12 seconds) but you can change it to whatever you want (120 is recommended)
    Duration transitionDuration = const Duration(milliseconds: 120),

    //* Function to be called when alert is dismissed
    Function? onDismissed,

    //* Custom haptic feedback function, if not provided, default haptic feedback will be used (Called after 100 milliseconds)
    Function? customHapticFeedback,
    Color? secondaryColor,
    Color? primaryColor,
    Color? errorColor,
    Color? successColor,
    bool overrideTheme = true,
  }) {
    // Setting default colors
    if (overrideTheme == false) {
      primaryColor ??= Theme.of(context).primaryColor;
      secondaryColor ??= Theme.of(context).colorScheme.secondary;
      errorColor ??= Theme.of(context).colorScheme.error;
      successColor ??= Theme.of(context).colorScheme.primary;
    } else {
      primaryColor ??= Colors.blue;
      secondaryColor ??= Colors.grey.shade100;
      errorColor ??= Colors.red;
      successColor ??= Colors.green;
    }

    //* Haptic feedback if available on device
    //* Only plays after 200 milliseconds for better user experience :).
    Future.delayed(const Duration(milliseconds: 100), () => customHapticFeedback != null ? customHapticFeedback() : HapticFeedback.lightImpact());
    showGeneralDialog(
      context: context,
      barrierLabel: "Sha Alert",
      barrierDismissible: true,
      barrierColor: backdropColor,
      transitionDuration: transitionDuration,
      useRootNavigator: true,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
                height: message.length > 80 ? height + 50 : height,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 10))]),
                child: SizedBox.expand(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(title, style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Custom child widget, if any
                      if (child != null) child,

                      // Action buttons
                      const SizedBox(height: 5),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: (secondButtonTitle != null && secondButtonTitle != "") ? 34 : 0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // If only one button is provided, show this spacer
                              Visibility(visible: (secondButtonTitle == null || secondButtonTitle == ""), maintainState: false, child: const Spacer()),
                              // First button
                              Expanded(
                                child: Button(
                                  primaryColor: primaryColor,
                                  secondaryColor: secondaryColor,
                                  errorColor: errorColor,
                                  successColor: successColor,
                                  title: firstButtonTitle,
                                  textStyle: firstButtonType == ButtonType.secondary ? const TextStyle(color: Colors.black) : null,
                                  onPressed: () {
                                    HapticFeedback.lightImpact();
                                    if (onFirstButtonPressed != null) {
                                      onFirstButtonPressed();
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                  width: double.infinity,
                                  buttonType: firstButtonType,
                                ),
                              ),

                              // Spacer if second button is not provided
                              Visibility(visible: (secondButtonTitle == null || secondButtonTitle == ""), maintainState: false, child: const Spacer()),

                              // If Both buttons are provided, show this spacer
                              Visibility(visible: (secondButtonTitle != null && secondButtonTitle != ""), maintainState: false, child: const SizedBox(height: 10)),

                              Visibility(
                                visible: (secondButtonTitle != null && secondButtonTitle != ""),
                                maintainState: false,
                                child: Expanded(
                                  child: Button(
                                    primaryColor: primaryColor,
                                    secondaryColor: secondaryColor,
                                    errorColor: errorColor,
                                    successColor: successColor,
                                    title: secondButtonTitle,
                                    onPressed: () {
                                      HapticFeedback.lightImpact();
                                      if (onSecondButtonPressed != null) {
                                        onSecondButtonPressed();
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    },
                                    width: double.infinity,
                                    buttonType: secondButtonType,
                                    textStyle: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        // Animation should start at 0.5 and end at 1.0
        final tween = Tween<double>(begin: 0.85, end: 1.0);
        anim = tween.animate(anim);
        anim = CurvedAnimation(parent: anim, curve: Curves.fastOutSlowIn);

        return ScaleTransition(
          scale: anim,
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
