import 'package:flutter/material.dart';

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width > 850;
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 550;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < 850 &&
    MediaQuery.of(context).size.width >= 550;
