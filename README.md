# Storybook


## Getting Started

Check example in [site](https://storybook.codemagic.app/#/)
<p align="center">
  <img src="https://github.com/zapiti/storybook/raw/main/example.gif" alt="Example" />
</p>

You will need to add the following dependency in your `pubspec.yaml` file to download the depedency.

```dart
dependencies:
  flutter:
    sdk: flutter
  storybook: 0.0.2

  // file to code
  assets:
    - lib/
    - lib/story/menu_principal/
    - lib/story/menu_secundario/
```

## Usage

 > import 'package:storybook/storybook.dart';

 ```dart
      runApp(storyBookHome(
          logo: Container(
            child: Text(
              'Storybook',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          listThemeData: [
            {'Theme': ThemeData()},
            {'Theme dark': ThemeData.dark()}
          ],
          listStoryBookModel: [
            storyCardSucess(),
            storyCarError(),
            storyButtonWin(),
            storyButtonFile()
          ]));
 ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.