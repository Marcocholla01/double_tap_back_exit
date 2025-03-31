# Changelog

## [1.0.0] - Initial Release

### Added
- Implemented `DoubleBackExit` widget to prevent accidental app exits.
- Added `duration` parameter to configure the double-back press interval.
- Introduced `showToast` function to allow custom toast/snackbar messages.
- Added support for both **back button taps** and **swipe gestures**.
- Introduced `tapExitMessage` and `swipeExitMessage` for default exit messages.
- Utilized `PopScope` for compatibility with Android predictive back gestures (Flutter 3.12+).

## [1.0.1] - Format