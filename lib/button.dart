import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sha_alert/color.dart';
import 'package:sha_alert/const.dart';

class Button extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final TextStyle? textStyle;
  final ButtonType buttonType;
  final bool isLoading;
  final double width;
  final double? height;
  final Color? secondaryColor;
  final Color? primaryColor;
  final Color? errorColor;
  final Color? successColor;
  const Button({
    super.key,
    this.title,
    this.width = 100,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.textStyle,
    this.buttonType = ButtonType.primary,
    this.height,
    this.secondaryColor,
    this.primaryColor,
    this.errorColor,
    this.successColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: isDisabled
          ? SystemMouseCursors.forbidden
          : isLoading
              ? SystemMouseCursors.wait
              : SystemMouseCursors.click,
      onTap: () {
        if (onPressed != null && !isDisabled && !isLoading) {
          onPressed!();
        }
      },
      child: Container(
        height: height,
        padding: const EdgeInsets.all(10),
        width: width,
        decoration: BoxDecoration(
          color: isDisabled
              ? const Color.fromARGB(26, 121, 121, 121)
              : buttonType == ButtonType.primary
                  ? primaryColor
                  : buttonType == ButtonType.secondary
                      ? secondaryColor
                      : buttonType == ButtonType.positive
                          ? successColor
                          : buttonType == ButtonType.negative
                              ? errorColor
                              : buttonType == ButtonType.warning
                                  ? UiColors.hexToColor('#FFC107')
                                  : primaryColor,
          borderRadius: BorderRadius.circular(ThemeConst.defaultBorderRadiusSmall),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            if (isLoading) const CupertinoActivityIndicator(color: Colors.white),
            if (!isLoading && title != null)
              Text(
                title!,
                style: textStyle ??
                    TextStyle(
                      color: isDisabled ? UiColors.hexToColor('#000000') : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            if (icon != null && !isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(icon, color: isDisabled ? UiColors.hexToColor('#000000') : textStyle?.color ?? Colors.white, size: 16),
              ),
            if (!isLoading) const Spacer(),
          ],
        ),
      ),
    );
  }
}

//Types of buttons:
enum ButtonType {
  primary,
  secondary,
  positive,
  negative,
  warning,
}
