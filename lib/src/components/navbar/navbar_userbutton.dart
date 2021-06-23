import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class NavbarUserButton extends StatelessWidget {
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final Clip? clipBehavior;
  final VoidCallback? onLongPress;
  final VoidCallback? onPressed;

  final Image? profileImage;
  final String? username;
  final String? email;

  const NavbarUserButton(
      {Key? key,
      this.style,
      this.focusNode,
      this.autoFocus,
      this.clipBehavior,
      this.onLongPress,
      this.onPressed,
      this.profileImage,
      this.username,
      this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        key: key,
        style: style,
        focusNode: focusNode,
        autofocus: autoFocus,
        clipBehavior: clipBehavior,
        onLongPress: onLongPress,
        onPressed: onPressed,
        icon: Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: profileImage ??
                Image.network(
                    "https://vue.pixelstrap.com/cuba/img/profile.c288e3dd.jpg"),
          ),
        ),
        label: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(username ?? "Unknown User"),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(email ?? ""), Icon(Icons.arrow_drop_down)],
            ),
          ],
        ));
  }
}

class NavbarUserPopUpButton<T> extends StatefulWidget {
  /// Called when the button is pressed to create the items to show in the menu.
  final PopupMenuItemBuilder<T> itemBuilder;

  /// The value of the menu item, if any, that should be highlighted when the menu opens.
  final T? initialValue;

  /// Called when the user selects a value from the popup menu created by this button.
  ///
  /// If the popup menu is dismissed without selecting a value, [onCanceled] is
  /// called instead.
  final PopupMenuItemSelected<T>? onSelected;

  /// Called when the user dismisses the popup menu without selecting an item.
  ///
  /// If the user selects a value, [onSelected] is called instead.
  final PopupMenuCanceled? onCanceled;

  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is
  /// used for accessibility.
  final String? tooltip;

  /// The z-coordinate at which to place the menu when open. This controls the
  /// size of the shadow below the menu.
  ///
  /// Defaults to 8, the appropriate elevation for popup menus.
  final double? elevation;

  /// Matches IconButton's 8 dps padding by default. In some cases, notably where
  /// this button appears as the trailing element of a list item, it's useful to be able
  /// to set the padding to zero.
  final EdgeInsetsGeometry padding;

  /// If provided, the [icon] is used for this button
  /// and the button will behave like an [IconButton].
  final Widget? icon;

  /// The offset applied to the Popup Menu Button.
  ///
  /// When not set, the Popup Menu Button will be positioned directly next to
  /// the button that was used to create it.
  final Offset offset;

  /// Whether this popup menu button is interactive.
  ///
  /// Must be non-null, defaults to `true`
  ///
  /// If `true` the button will respond to presses by displaying the menu.
  ///
  /// If `false`, the button is styled with the disabled color from the
  /// current [Theme] and will not respond to presses or show the popup
  /// menu and [onSelected], [onCanceled] and [itemBuilder] will not be called.
  ///
  /// This can be useful in situations where the app needs to show the button,
  /// but doesn't currently have anything to show in the menu.
  final bool enabled;

  /// If provided, the shape used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.shape] is used.
  /// If [PopupMenuThemeData.shape] is also null, then the default shape for
  /// [MaterialType.card] is used. This default shape is a rectangle with
  /// rounded edges of BorderRadius.circular(2.0).
  final ShapeBorder? shape;

  /// If provided, the background color used for the menu.
  ///
  /// If this property is null, then [PopupMenuThemeData.color] is used.
  /// If [PopupMenuThemeData.color] is also null, then
  /// Theme.of(context).cardColor is used.
  final Color? color;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// If provided, the size of the [Icon].
  ///
  /// If this property is null, the default size is 24.0 pixels.
  final double? iconSize;

  final Image? profileImage;
  final String? username;
  final String? email;

  const NavbarUserPopUpButton(
      {Key? key,
      required this.itemBuilder,
      this.initialValue,
      this.onSelected,
      this.onCanceled,
      this.tooltip,
      this.elevation,
      this.padding = const EdgeInsets.all(8.0),
      this.icon,
      this.iconSize,
      this.offset = Offset.zero,
      this.enabled = true,
      this.shape,
      this.color,
      this.enableFeedback,
      this.profileImage,
      this.username,
      this.email})
      : super(key: key);

  @override
  _NavbarUserPopUpButtonState<T> createState() => _NavbarUserPopUpButtonState<T>();
}

class _NavbarUserPopUpButtonState<T> extends State<NavbarUserPopUpButton<T>> {
  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 12 : lerpDouble(12, 6, math.min(scale - 1, 1))!;

    return PopupMenuButton<T>(
      key: widget.key,
      itemBuilder: widget.itemBuilder,
      initialValue: widget.initialValue,
      onSelected: widget.onSelected,
      onCanceled: widget.onCanceled,
      tooltip: widget.tooltip,
      elevation: widget.elevation,
      padding: widget.padding,
      icon: widget.icon,
      iconSize: widget.iconSize,
      offset: widget.offset,
      enabled: widget.enabled,
      shape: widget.shape,
      color: widget.color,
      enableFeedback: widget.enableFeedback,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: widget.profileImage ??
                  Image.network(
                      "https://vue.pixelstrap.com/cuba/img/profile.c288e3dd.jpg"),
            ),
          ),
          SizedBox(width: gap),
          Flexible(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.username ?? "Unknown User",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.email ?? ""),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class TextIconWidget extends StatelessWidget {
  final Widget? icon;
  final Widget? label;

  const TextIconWidget({Key? key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return Container(
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: icon ?? SizedBox(),
          ),
        ),
        SizedBox(width: gap),
        Flexible(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [label ?? SizedBox()],
        )),
      ]),
    );
  }
}
