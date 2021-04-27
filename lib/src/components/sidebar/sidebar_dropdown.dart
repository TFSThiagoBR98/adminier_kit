import 'package:flutter/material.dart';

import './expansion_tile.dart';

class SidebarDropdown extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final List<Widget> submenus;
  final Widget? trailing;

  const SidebarDropdown(
      {Key? key,
      this.title = const Text(""),
      this.subtitle,
      this.leading,
      this.submenus = const <Widget>[],
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: InternalExpansionTile(
        title: title,
        subtitle: subtitle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: leading,
        children: submenus,
        trailing: trailing,
      ),
    );
  }
}
