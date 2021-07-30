import 'package:example/menu_principal/button_win.dart';
import 'package:storybook/storybook.dart';

StoryBookModel storyButtonWin() => StoryBookModel(
        storyTitle: 'Menu Principal',
        storyDescription: "Button win",
        story: StoryElementModel(
            builder: (action) => ButtonWin(
                  msg: 'ButtonWin',
                  enable: action?.first.actualState,
                )),
        sourceStoryFilePath: 'lib/story/menu_principal/button_win.dart',
        storyActions: [
          StoryActionModel(
              text: 'Enable',
              positiveState: true,
              negativeState: false,
              actualState: true)
        ]);
