import 'package:example/menu_principal/card_sucess.dart';

import 'package:storybook/storybook.dart';

StoryBookModel storyCardSucess() => StoryBookModel(
        storyTitle: 'Menu Principal',
        storyDescription: "Card",
        subStoryDescription: 'Win card',
        story: StoryElementModel(
            builder: (action) => CardSucess(
                  msg: 'CardSucess',
                  update: action?.first.actualState,
                )),
        sourceStoryFilePath: 'lib/story/menu_principal/card_sucess.dart',
        storyActions: [
          StoryActionModel(
              text: 'Update',
              positiveState: 'Sucess update',
              negativeState: null,
              actualState: null)
        ]);
