import 'package:flutter/material.dart';

class AdminierSidebarDrawer extends StatefulWidget {
  final double elevation;
  final Widget? header;
  final List<Widget>? menus;

  AdminierSidebarDrawer(
      {Key? key, this.elevation = 16.0, this.header, this.menus});

  @override
  _AdminierSidebarDrawerState createState() => _AdminierSidebarDrawerState();
}

class _AdminierSidebarDrawerState extends State<AdminierSidebarDrawer> {
  List<Widget> buildNav() {
    List<Widget> nav = <Widget>[];
    if (widget.header != null) {
      nav.add(widget.header!);
    }
    nav.add(SizedBox(
      height: 8,
    ));
    if (widget.menus != null) {
      nav.addAll(widget.menus!);
    }
    return nav;
  }

  @override
  Widget build(BuildContext context) {
    double _minDrawerWidget = 290;
    return Container(
      width: _minDrawerWidget,
      child: Padding(
        padding: EdgeInsets.only(right: widget.elevation + 5),
        child: Drawer(
          elevation: widget.elevation,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: buildNav(),
            ),
          ),
        ),
      ),
    );
  }
}
