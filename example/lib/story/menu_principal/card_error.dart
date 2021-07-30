import 'package:example/menu_principal/card_error.dart';
import 'package:storybook/storybook.dart';

StoryBookModel storyCarError() => StoryBookModel(
        storyTitle: 'Menu Principal',
        storyDescription: "Card",
        subStoryDescription: 'Error card',
        story: StoryElementModel(
            builder: (action) => CardError(
                  error: 'CardError',
                  disable: action?.first.actualState ,
                )),
        sourceStoryFilePath: 'lib/story/menu_principal/card_error.dart',
        storyActions: [
          StoryActionModel(
              text: 'Desable',
              positiveState: true,
              negativeState: false,
              actualState: false)
        ]);
