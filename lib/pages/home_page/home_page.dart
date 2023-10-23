import 'package:flutter/material.dart';
import '../../core/utils/utils.dart';
import 'views/home_views.dart';

class HomePage extends BasePage {
  const HomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  mobileBody(BuildContext context) {
    return HomeMobile(child: child);
  }
}
