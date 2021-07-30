import 'package:example/menu_secundario/button_file.dart';
import 'package:storybook/storybook.dart';

StoryBookModel storyButtonFile() => StoryBookModel(
        storyTitle: 'Menu Secundario',
        storyDescription: "Button-File",
        subStoryDescription: 'File',
        story: StoryElementModel(
            builder: (states) => ButtonFile(
                  text: states?.first.actualState ? 'Sucesso' : 'ButtonFile',
                )),
        sourceStoryFilePath: 'lib/story/menu_secundario/button_file.dart',
        storyActions: [
          StoryActionModel(
              text: 'Selecione',
              positiveState: true,
              negativeState: false,
              actualState: true)
        ]);
