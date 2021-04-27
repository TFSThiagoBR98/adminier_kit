import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SidebarMenu(
      {Key? key,
      this.title,
      this.subtitle,
      this.leading,
      this.trailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: ListTile(
        key: key,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
