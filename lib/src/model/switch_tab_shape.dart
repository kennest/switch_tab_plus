/// Basically, it is shape of a tab.
enum SwitchTabShape { rounded, rectangle }

extension SwitchTabShapeX on SwitchTabShape {
  bool get isRounded => this == SwitchTabShape.rounded;

  bool get isRectangle => this == SwitchTabShape.rectangle;
}
