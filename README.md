## Sha alerts - Alert dialogs for flutter with UX in mind.

[Sha alert](https://pub.dev/packages/sha_alert) is alert dialogs designed by considering user experience and user interface in first place.
<br>
<br>


<div align='center'>

<img width='30%' src='https://i.ibb.co/FmjzMSm/hero-modified.png'>
</div>


<br>


Sha alert supports 5 types of alert dialogs.
<b> - Primary

- Secondary
- Positive
- Negative
- Warning

</b>

### Features and UX

- Haptic feedbacks on supported devices.
- Naturally animated (Not starting scale from 0 to 1 instead 0.7 to 1).
- Scale animation + alpha animation.
- Two action buttons.
- Customizable title, message, action buttons and colors.

<b> PRO TIP 🚀 : Read my article on fueler on how to design alert dialogs [here](https://fueler.io/shajin/how-to-design-alert-dialogs-ux-flutter)
<b>

## Screenshots

<div style="display: flex; flex-wrap: wrap;">
    <img width='30%' src="https://i.ibb.co/Mfn3NWv/Whats-App-Image-2023-07-30-at-12-34-05-PM-2.jpg"/>
    <img width='30%' src="https://i.ibb.co/7YN7j6x/Simulator-Screenshot-i-Phone-14-Pro-2023-07-30-at-17-49-42.png"/>
    <img width='30%' src="https://i.ibb.co/tB1Y2fK/Simulator-Screenshot-i-Phone-14-Pro-2023-07-30-at-18-00-26.png"/>
    <img width='30%' src="https://i.ibb.co/c6g10QX/Simulator-Screenshot-i-Phone-14-Pro-2023-07-30-at-17-57-25.png"/>
</div>

## Installation

```
dependencies:
  sha_alert: ^0.0.1
```

## Usage

```dart

ShaAlert.showHozzoAlert(
  context: context,
  title: 'Welcome Note',
  message: 'Happy to see you on board! Please read the terms and conditions carefully.',
  firstButtonTitle: "I Agree",
  firstButtonType: ButtonType.primary,
  onFirstButtonPressed: () {
    // Code to be executed when the first button is pressed
  },
  secondButtonTitle: "Read Terms and Conditions",
  onSecondButtonPressed: () {
    // Code to be executed when the second button is pressed
  },
);

```



### Parameters:

1. `context` (BuildContext) - *(Required)* This context should contain the navigator for the alert to work properly and pop itself.

2. `title` (String) - *(Required)* The title of the alert dialog.

3. `message` (String) - *(Required)* The main message/content of the alert dialog.

4. `firstButtonTitle` (String) - *(Required)* The title of the first action button.

5. `secondButtonTitle` (String, optional) - The title of the second action button. If not provided, only one button will be shown.

6. `onFirstButtonPressed` (Function, optional) - Function to be called when the first action button is pressed.

7. `onSecondButtonPressed` (Function, optional) - Function to be called when the second action button is pressed.

8. `firstButtonType` (ButtonType, optional) - The type of the first action button. Default is `ButtonType.negative`. Possible values are `ButtonType.negative`, `ButtonType.positive`, and `ButtonType.secondary`.

9. `secondButtonType` (ButtonType, optional) - The type of the second action button. Default is `ButtonType.secondary`. Possible values are `ButtonType.negative`, `ButtonType.positive`, and `ButtonType.secondary`.

10. `height` (double, optional) - Height of the alert dialog. Default is 280 pixels.

11. `child` (Widget, optional) - Use this for showing custom widgets or even images. This can be used to add additional content to the alert dialog. Make sure to set the `height` accordingly if you use this parameter.

12. `backdropColor` (Color, optional) - Backdrop color of the alert dialog. Default is `Colors.black54` (black with 54% opacity).

13. `transitionDuration` (Duration, optional) - Default transition duration for the alert dialog. Default is 120 milliseconds (0.12 seconds).

14. `onDismissed` (Function, optional) - Function to be called when the alert is dismissed (e.g., when the user taps outside the dialog).

15. `customHapticFeedback` (Function, optional) - Custom haptic feedback function to be called when the alert is displayed. If not provided, default haptic feedback will be used. This function will be called after 100 milliseconds.

16. `secondaryColor` (Color, optional) - Custom color for secondary elements in the alert dialog (e.g., button backgrounds). If `overrideTheme` is set to `false`, this color will be set to the secondary color of the current theme. Otherwise, the default is `Colors.grey.shade100`.

17. `primaryColor` (Color, optional) - Custom color for primary elements in the alert dialog (e.g., button text). If `overrideTheme` is set to `false`, this color will be set to the primary color of the current theme. Otherwise, the default is `Colors.blue`.

18. `errorColor` (Color, optional) - Custom color for error elements in the alert dialog (e.g., error button backgrounds). If `overrideTheme` is set to `false`, this color will be set to the error color of the current theme. Otherwise, the default is `Colors.red`.

19. `successColor` (Color, optional) - Custom color for success elements in the alert dialog (e.g., success button backgrounds). If `overrideTheme` is set to `false`, this color will be set to the primary color of the current theme. Otherwise, the default is `Colors.green`.

20. `overrideTheme` (bool, optional) - If set to `true`, the custom colors specified (`primaryColor`, `secondaryColor`, `errorColor`, `successColor`) will be used. If set to `false`, the colors will be set based on the current theme.




### Author
Shajin KP - [shajin.in](https://shajin.in)


### Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
