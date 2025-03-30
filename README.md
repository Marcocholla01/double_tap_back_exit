# DoubleTapBackExit

A Flutter utility package that prevents accidental app exits by requiring a double-tap or swipe gesture to exit. It allows customizable exit messages and integrates with custom toast notifications.

## Features

- Detects **back button press** and **swipe gestures** for exit.
- Allows **custom exit messages** for tap and swipe actions.
- Supports **custom toast/snackbar notifications**.
- Optional **swipe-to-exit** toggle.
- Uses **PopScope** for Android predictive back gestures (Flutter 3.12+ compatible).

## Installation

Add the following to your **pubspec.yaml**:

```yaml
dependencies:
  double_tap_back_exit: latest_version
```

## Usage

Wrap your app's **home screen** with `DoubleTapBackExit`:

```dart
import 'package:double_tap_back_exit/double_tap_back_exit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoubleTapBackExit(
        duration: Duration(seconds: 3),
        tapExitMessage: "Tap again to close the app!",
        swipeExitMessage: "Swipe again to exit!",
        enableSwipeBack: true,
        enableTapBack: true,
        showToast: (context) => _showCustomToast(context),
        child: HomeScreen(),
      ),
    );
  }

  void _showCustomToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Tap again to exit"),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
```

## Properties

| Property           | Type                      | Default                      | Description                                                            |
| ------------------ | ------------------------- | ---------------------------- | ---------------------------------------------------------------------- |
| `child`            | `Widget`                  | **Required**                 | The main widget wrapped inside `DoubleTapBackExit` (e.g., `HomeScreen`).  |
| `duration`         | `Duration`                | `Duration(seconds: 2)`       | Time interval for double-tap/swipe detection.                          |
| `showToast`        | `Function(BuildContext)?` | `null`                       | Custom toast/snackbar function. If `null`, a default Snackbar is used. |
| `enableSwipeBack`  | `bool`                    | `true`                       | Enables/disables swipe-to-exit.                                        |
| `enableTapBack`    | `bool`                    | `true`                       | Enables/disables tap-to-exit.                                          |
| `tapExitMessage`   | `String?`                 | `"Press back again to exit"` | Custom message for tap exit.                                           |
| `swipeExitMessage` | `String?`                 | `"Swipe again to exit"`      | Custom message for swipe exit.                                         |

### Important Note:
If you use a custom showToast function, like this:

```dart
showToast: (context) => _showCustomToast(context),

```
Then, you do not need to pass `tapExitMessage` or `swipeExitMessage`, since your custom function will handle the message display

## Demo

*Add screenshots or a GIF here to show how it works*

## License

MIT License. See `LICENSE` for details.

---

### 🚀 Enhance User Experience

Use `DoubleTapBackExit` to **prevent accidental exits** and improve app usability!

