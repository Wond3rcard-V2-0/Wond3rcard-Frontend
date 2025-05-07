import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: (context) => mobile,
      tablet: (context) => tablet,
      desktop: (context) => desktop,
    );
  }
}
