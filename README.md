# switch_tab_plus

A flutter package that allows toggling as a tab bar.

## Getting started

Add the dependency to `pubspec.yaml`:
```yaml
switch_tab_plus:
```

Import package
```dart
import 'package:switch_tab_plus/switch_tab_plus.dart';
```

## Example
```dart
SwitchTabPlus(
  text: const ["Flutter", "React Native"],
  shape: SwitchTabShape.rectangle,
  thumbColor: Colors.orange,
  onValueChanged: (index) {},
)
```
![switch tab plus](https://github.com/radikz/switch_tab/blob/32c41c803d0cb133d90ed7e9c4b1610c7fd59fbd/example.gif)

## Contributing
Any kind of support in the form of reporting bugs, answering questions or PRs is always appreciated.
