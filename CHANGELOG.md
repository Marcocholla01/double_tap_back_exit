# Changelog

## **1.0.0 - Initial Release**

### **Added**
- Introduced the `DoubleBackExit` widget to prevent accidental app exits by requiring a double-tap or swipe gesture.
- Added the `duration` parameter to configure the time interval within which the second tap or swipe should occur to exit the app.
- Implemented the `showToast` function to allow for custom toast or snackbar messages when the user attempts to exit.
- Supported both **back button taps** and **swipe gestures** for the exit action.
- Added `tapExitMessage` and `swipeExitMessage` for customizable default messages when the user taps or swipes to exit.
- Integrated `PopScope` for compatibility with Android's predictive back gestures (Flutter 3.12+).


## **1.0.1 - Format**

### **Changes**
- **Code Formatting & Refactor**: 
  - Enhanced the readability and structure of the codebase by cleaning up unnecessary clutter and ensuring a consistent format.
  - Improved indentation and spacing for better understanding.
  - Refined alignment and spacing between function arguments and code blocks to adhere to Dart style guidelines.
  - Consistently placed comments to explain code functionality where needed.

## **1.0.2 - Dart Documentation**

### **Changes**
- **Dart Doc Integration**: 
  - Added detailed doc comments across key classes, methods, and properties, making the codebase more developer-friendly.
  - Clarified the purpose of each class and method to help developers understand how to use the package effectively.
  - Explained the expected behavior of each property and its default value in the documentation.
  - Included example code in the doc comments for clearer usage guidance and better integration with developer workflows.

## **1.0.3 - Rename `DoubleBackExit` to `DoubleTapBackExit`**

### **Changes**
- **Class Name Change**: 
  - Renamed the class from `DoubleBackExit` to `DoubleTapBackExit` to more accurately reflect its functionality. The new name better describes the action of **double tapping** to exit the app.
  - Ensured backward compatibility by adjusting constructor names and method calls across the codebase.
  - Updated the documentation, example code, and README to reflect the new class name for improved clarity.
  - This change improves the semantic meaning of the class name and better aligns with its core functionality.


<!-- ## **1.1.0 - 2025-04-05**

### **Added**
- **Example App**: 
  - Added a comprehensive example app to demonstrate the usage of the `DoubleTapBackExit` widget, making it easier for developers to integrate the widget into their own applications.
  - The example app includes a working implementation of the widget with customizable exit messages and a custom toast/snackbar.
  
- **Custom Toast Example**: 
  - Provided an example of using a custom toast message (via a `SnackBar`) for the back button exit. This allows developers to create personalized notifications when users attempt to exit the app.
  

### **Improvements**
- Enhanced documentation with a focus on clarity, making it easier for developers to follow the usage instructions and examples.
- Cleaned up the overall structure and organization of the README to improve accessibility. -->

## **1.1.0 - 2025-04-05**

### **Added**
- **Example App**: 
  - Added a comprehensive example app to demonstrate the usage of the `DoubleTapBackExit` widget, making it easier for developers to integrate the widget into their own applications.
  - The example app includes a working implementation of the widget with customizable exit messages and a custom toast/snackbar.

- **Custom Toast Example**: 
  - Provided an example of using a custom toast message (via a `SnackBar`) for the back button exit. This allows developers to create personalized notifications when users attempt to exit the app.

### **Improvements**
- **Enhanced Documentation**: 
  - Improved the clarity of the README documentation, making it easier for developers to understand how to use the `DoubleTapBackExit` widget effectively.
  - Added detailed instructions for setting up the package, including adding assets (images, GIFs) and usage examples.
  
- **Updated README - Contributions Section**: 
  - Added a comprehensive **Contributing** section to encourage developers to contribute to the project. It includes clear instructions on how to fork, branch, and submit pull requests.
  - Added a section explaining the reason for creating the package to help users understand its value and purpose.
  - Included a reminder to star the repository for those who find the package useful, helping boost the project's visibility.

- **Improved README Structure**:
  - Cleaned up the structure and organization of the README to improve accessibility, making the content easier to navigate.