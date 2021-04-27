import 'package:flutter/material.dart';

class NavbarTitle extends StatefulWidget {
  final Widget? leading;
  final Widget? title;

  const NavbarTitle({Key? key, this.leading, this.title}) : super(key: key);

  @override
  _NavbarTitleState createState() => _NavbarTitleState();
}

class _NavbarTitleState extends State<NavbarTitle> {
  List<Widget> buildNav(BuildContext context, BoxConstraints constraints) {
    var displayConstrains = MediaQuery.of(context).size;
    List<Widget> nav = <Widget>[];
    if (widget.leading != null) {
      nav.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: widget.leading!,
      ));
    }
    if (widget.title != null &&
        constraints.maxWidth > displayConstrains.width * 0.7) {
      nav.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: widget.title!,
      ));
    }
    return nav;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buildNav(context, constrains),
      );
    });
  }
}
