import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoubleBackExit extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Function(BuildContext)? showToast;
  final bool enableSwipeBack;
  final bool enableTapBack;
  final String? tapExitMessage;
  final String? swipeExitMessage;

  const DoubleBackExit({
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
  _DoubleBackExitState createState() => _DoubleBackExitState();
}

class _DoubleBackExitState extends State<DoubleBackExit> {
  DateTime? lastPressed;

  void _handleBackAction({required bool isSwipe}) {
    final now = DateTime.now();

    // Use provided messages or fallback to default ones
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
