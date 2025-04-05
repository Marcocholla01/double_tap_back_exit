import 'package:double_tap_back_exit/double_tap_back_exit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleAppTest());
}

/// A simple app demonstrating the use of the [DoubleTapBackExit] widget.
class ExampleAppTest extends StatelessWidget {
  const ExampleAppTest({super.key});

  /// Custom function to display a snack bar when the user presses back.
  ///
  /// [context] is required to access the [ScaffoldMessenger] for showing the snack bar.
  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Press back again to exit."),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DoubleTapBackExit(
        enableSwipeBack: true,

        /// Enable swipe-to-exit functionality (optional -- defaults to true)
        enableTapBack: true,

        /// Enable back button tap-to-exit functionality (optional -- defaults to true)
        swipeExitMessage: "Swipe again to exit",

        /// Custom swipe exit message (optional -- defaults to "Swipe again to exit")
        tapExitMessage:
            "Press back again to exit", // Custom tap exit message (optional --defaults to "Tap again to exit")
        showToast: (context) => _showToast(context),

        /// Custom toast function
        duration: const Duration(seconds: 1),

        /// Time duration for the second back press/swipe (optional --defaults to 2 seconds )
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Double Tap Back Exit Example'),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
          ),
          body: const Center(
            child: Text(
              'Press back button twice to exit.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
