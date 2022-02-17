import 'package:flutter/material.dart';
import 'package:switch_tab/src/model/switch_tab_shape.dart';
import 'package:switch_tab/src/switch_tab_border_radius.dart';

class SingleTabWidget extends StatelessWidget {
  const SingleTabWidget({
    Key? key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.selected,
    required this.text,
    required this.onTap,
    required this.shape,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    this.icon,
    this.style,
  }) : super(key: key);

  final Color selectedColor;
  final Color unSelectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final bool selected;
  final String text;
  final TextStyle? style;
  final Widget? icon;
  final Function() onTap;
  final SwitchTabShape shape;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: selected ? selectedColor : unSelectedColor,
            borderRadius: shape.isRounded
                ? SwitchTabBorderRadius.circularBorder
                : SwitchTabBorderRadius.rectangleBorder,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: style ??
                    TextStyle(
                        color:
                            selected ? selectedTextColor : unselectedTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
