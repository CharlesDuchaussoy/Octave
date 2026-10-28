import 'package:flutter/widgets.dart';

/// Space to leave after the last item of a scrolling screen.
///
/// The bottom padding holds the floating mini player and tab bar (see
/// `MainScreen`) or the system navigation bar, so the last item stays
/// reachable above them.
double scrollEndPadding(BuildContext context) =>
    24 + MediaQuery.paddingOf(context).bottom;
