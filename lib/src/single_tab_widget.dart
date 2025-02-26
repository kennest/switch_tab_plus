import 'package:flutter/material.dart';
import 'package:switch_tab_plus/src/model/switch_tab_shape.dart';
import 'package:switch_tab_plus/src/switch_tab_border_radius.dart';

class SingleTabWidget extends StatelessWidget {
  const SingleTabWidget(
      {Key? key,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.selected,
      required this.text,
      required this.onTap,
      required this.shape,
      required this.selectedTextColor,
      required this.unselectedTextColor,
      this.icon,
      this.border,
      this.selectTextStyle,
      this.unSelectTextStyle,
      this.gradient})
      : super(key: key);

  final Color selectedColor;
  final Color unSelectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final bool selected;
  final String text;
  final TextStyle? selectTextStyle;
  final TextStyle? unSelectTextStyle;
  final Widget? icon;
  final Function() onTap;
  final SwitchTabShape shape;
  final LinearGradient? gradient;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: border,
            color: gradient == null
                ? (selected ? selectedColor : unSelectedColor)
                : null,
            gradient: selected ? gradient : null,
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
                style: selected
                    ? TextStyle(
                        color: selectedTextColor,
                        fontWeight: FontWeight.bold,
                      ).merge(selectTextStyle)
                    : TextStyle(
                        color: unselectedTextColor,
                        fontWeight: FontWeight.bold,
                      ).merge(unSelectTextStyle),
              )
            ],
          ),
        ),
      ),
    );
  }
}
