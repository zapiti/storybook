import 'package:flutter/material.dart';
import 'package:storybook/storybook.dart';

void main() {
  runApp(storyBookHome(listStoryBookModel: [
    StoryBookModel(
        storyTitle: 'Menu Principal',
        storyDescription: "Botao de inicio",
        storyImports: [
          "import 'package:storybook_flutter/storybook_flutter.dart';",
          "import '../../marketplace_ui.dart';"
        ],
        storyCode: "CardError(error: 'Ocorreu um erro')",
        story: CardError(error: 'Ocorreu um erro')),
    StoryBookModel(
        storyTitle: 'Menu Principal',
        storyDescription: "Botao de final",
        storyImports: [
          "import 'package:storybook_flutter/storybook_flutter.dart';",
          "import '../../marketplace_ui.dart';"
        ],
        storyCode: "CardError(error: 'Ocorreu um erro')",
        story: CardError(error: 'Ocorreu um erro')),
    StoryBookModel(
        storyTitle: 'Menu Secundario',
        storyDescription: "Botao de inicio",
        storyImports: [
          "import 'package:storybook_flutter/storybook_flutter.dart';",
          "import '../../marketplace_ui.dart';"
        ],
        storyCode: "CardError(error: 'Ocorreu um erro')",
        story: CardError(error: 'Ocorreu um erro'))
  ]));
}

class CardError extends StatelessWidget {
  String error;

  CardError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:  ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: Text(error))),
    );
  }
}
