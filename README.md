# Storybook


## Getting Started

You will need to add the following dependency in your `pubspec.yaml` file to download the depedency.

```dart
dependencies:
  flutter:
    sdk: flutter
  storybook: 0.0.1
```

## Usage

 > import 'package:storybook/storybook.dart';

 ```dart
      runApp(storyBookHome(listStoryBookModel: [
        StoryBookModel(
            storyTitle: 'Menu Principal',
            storyDescription: "Botao de inicio",
            storyImports: [
              "import 'package:storybook_flutter/storybook_flutter.dart';",
            ],
            storyCode: "CardError(error: 'Ocorreu um erro')",
            story: CardError(error: 'Ocorreu um erro')),]))
 ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.