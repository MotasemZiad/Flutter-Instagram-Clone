import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({
    Key? key,
    required this.mobileLayoutScreen,
    required this.webLayoutScreen,
  }) : super(key: key);

  final Widget mobileLayoutScreen;
  final Widget webLayoutScreen;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webLayoutScreen;
        }
        return mobileLayoutScreen;
      },
    );
  }
}
