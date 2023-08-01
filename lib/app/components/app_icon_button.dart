import 'package:flutter/material.dart';

class AppIconButton extends StatefulWidget {
  AppIconButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isTitleFirst = false,
    TextStyle? textStyle,
  }) {
    if (textStyle == null) {
      this.textStyle = const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
    } else {
      this.textStyle = textStyle;
    }
  }

  String title;
  IconData icon;
  Function? onTap;
  bool isTitleFirst;
  late TextStyle textStyle;

  bool isHighlighted = false;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap?.call(),
      onHighlightChanged: (value) => setState(() {
        widget.isHighlighted = value;
      }),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getButton(),
      ),
    );
  }

  List<Widget> getButton() {
    Color color =
        widget.isHighlighted ? Colors.black.withOpacity(0.3) : Colors.black;

    if (!widget.isTitleFirst) {
      return [
        Icon(widget.icon, color: color),
        const SizedBox(width: 8),
        Text(widget.title, style: widget.textStyle.copyWith(color: color)),
      ];
    }

    return [
      Text(widget.title, style: widget.textStyle.copyWith(color: color)),
      Icon(widget.icon, color: color),
    ];
  }
}
