import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that prevents accidental app exits by requiring a double-tap or swipe gesture.
///
/// This widget listens for back button presses or swipe gestures and prompts
/// the user to confirm the exit within a specified duration.
class DoubleTapBackExit extends StatefulWidget {
  /// The main content of the app wrapped within this widget.
  final Widget child;

  /// The time duration within which the second back press/swipe should occur to exit the app.
  ///
  /// Defaults to `Duration(seconds: 2)`.
  final Duration duration;

  /// A custom function to show a toast/snackbar when the user presses back.
  ///
  /// If provided, this function will be used instead of the default snackbar.
  final Function(BuildContext)? showToast;

  /// Enables or disables the swipe-to-exit feature.
  ///
  /// Defaults to `true`. Set to `false` to disable swipe back functionality.
  final bool enableSwipeBack;

  /// Enables or disables the tap-to-exit feature.
  ///
  /// Defaults to `true`. Set to `false` to disable back button exit functionality.
  final bool enableTapBack;

  /// The message displayed when the user presses the back button.
  ///
  /// Defaults to `"Press back again to exit"`.
  final String? tapExitMessage;

  /// The message displayed when the user swipes to exit.
  ///
  /// Defaults to `"Swipe again to exit"`.
  final String? swipeExitMessage;

  /// Creates a [DoubleTapBackExit] widget.
  ///
  /// Wrap your home screen widget with this to enable double back exit functionality.
  const DoubleTapBackExit({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.showToast,
    this.enableSwipeBack = true,
    this.enableTapBack = true,
    this.tapExitMessage,
    this.swipeExitMessage,
  });

  @override
  _DoubleTapBackExitState createState() => _DoubleTapBackExitState();
}

class _DoubleTapBackExitState extends State<DoubleTapBackExit> {
  DateTime? lastPressed;

  /// Handles the back action based on whether it's a swipe or a tap.
  void _handleBackAction({required bool isSwipe}) {
    final now = DateTime.now();

    /// Determine the exit message based on user interaction type (tap/swipe)
    final exitMessage =
        isSwipe
            ? widget.swipeExitMessage ?? "Swipe again to exit"
            : widget.tapExitMessage ?? "Press back again to exit";

    if (lastPressed == null || now.difference(lastPressed!) > widget.duration) {
      lastPressed = now;

      if (widget.showToast != null) {
        widget.showToast!(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(exitMessage),
            duration: widget.duration,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    } else {
      SystemNavigator.pop(); // Exit the app
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && widget.enableTapBack) {
          _handleBackAction(isSwipe: false);
        }
      },
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (widget.enableSwipeBack &&
              details.primaryVelocity != null &&
              details.primaryVelocity!.abs() > 500) {
            _handleBackAction(isSwipe: true);
          }
        },
        child: widget.child,
      ),
    );
  }
}
