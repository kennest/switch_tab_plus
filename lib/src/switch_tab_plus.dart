import 'package:flutter/material.dart';
import 'package:switch_tab/src/controller/switch_notifier.dart';
import 'package:switch_tab/src/model/switch_tab_shape.dart';
import 'package:switch_tab/src/single_tab_widget.dart';
import 'package:switch_tab/src/switch_tab_border_radius.dart';

class SwitchTabPlus extends StatefulWidget {
  const SwitchTabPlus({
    Key? key,
    required this.onValueChanged,
    required this.text,
    this.backgroundColour = Colors.white,
    this.thumbColor = Colors.lightBlueAccent,
    this.icon,
    this.border,
    this.gradient,
    this.shape = SwitchTabShape.rounded,
    this.selectedTextColor = Colors.black,
    this.unselectedTextColor = Colors.black,
    this.selectedStyle,
    this.unSelectedStyle,
  })  : assert(text.length <= 2, "Must not more than 2"),
        super(key: key);

  final List<String> text;

  final List<Widget>? icon;

  /// The color used to paint the background of tab.
  ///
  /// The default value is [Colors.white]
  final Color? backgroundColour;

  /// The color used to paint the interior of the thumb that appears behind the
  /// currently selected item.
  ///
  /// The default value is a [Colors.lightBlueAccent].
  final Color? thumbColor;

  /// The style used for selected text
  final TextStyle? selectedStyle;

  /// The style used for text
  final TextStyle? unSelectedStyle;

  // The border of the tab
  final BoxBorder? border;

  /// The gradiant the text when selected
  final LinearGradient? gradient;

  ///
  /// Default value is a [Colors.black]; ignored if style is not null
  final Color selectedTextColor;

  /// The color to paint the text when unselected
  ///
  /// Default value is a [Colors.black]; ignored if style is not null
  final Color unselectedTextColor;

  /// The callback that is called when a new option is tapped.
  final Function(int) onValueChanged;

  /// The shape of tab.
  ///
  /// The default value is a [SwitchTabShape.rounded]
  final SwitchTabShape shape;

  @override
  _SwitchTabPlusState createState() => _SwitchTabPlusState();
}

class _SwitchTabPlusState extends State<SwitchTabPlus> {
  late SwitchNotifier _notifier;

  @override
  void initState() {
    _notifier = SwitchNotifier();
    if (widget.icon != null) {
      assert(widget.icon!.length == widget.text.length);
    }
    super.initState();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _notifier,
      builder: (context, index, ch) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: widget.shape.isRounded
                ? SwitchTabBorderRadius.circularBorder
                : SwitchTabBorderRadius.rectangleBorder,
            color: widget.backgroundColour,
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i <= widget.text.length - 1; i++)
                SingleTabWidget(
                  selectedColor: widget.thumbColor!,
                  unSelectedColor: widget.backgroundColour!,
                  selectedTextColor: widget.selectedTextColor,
                  unselectedTextColor: widget.unselectedTextColor,
                  border: widget.border,
                  selected: i == index,
                  text: widget.text[i],
                  icon: widget.icon?[i],
                  shape: widget.shape,
                  unSelectTextStyle: widget.unSelectedStyle,
                  selectTextStyle: widget.selectedStyle,
                  onTap: () {
                    _notifier.change(i);
                    widget.onValueChanged(i);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
