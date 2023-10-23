import 'package:flutter/material.dart';

import '../../gen/l10n.dart';

abstract class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1280) {
          return const _BaseWidget();
        } else if (constraints.maxWidth >= 650) {
          return const _BaseWidget();
        } else {
          return mobileBody(context) ?? const _BaseWidget();
        }
      },
    );
  }

  Widget? mobileBody(BuildContext context) => null;
  Widget? tabletBody(BuildContext context) => null;
  Widget? desktopBody(BuildContext context) => null;
}

class _BaseWidget extends StatelessWidget {
  const _BaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Center(
            child: Text(S.of(context).comingSoon),
          ),
        ),
      ),
    );
  }
}
