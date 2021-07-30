import 'package:flutter/material.dart';
import 'package:storybook/src/model/story_action_model.dart';

class StatesListWidget extends StatelessWidget {
  final List<StoryActionModel>? lisActions;
  final Function(List<StoryActionModel>) onChangeList;

  const StatesListWidget(
      {Key? key, required this.lisActions, required this.onChangeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
          color: Colors.white,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: lisActions
                        ?.asMap()
                        .map(
                          (index, e) => MapEntry(
                              index,
                              Container(
                                  width: 200,color: Colors.grey[100],
                                  child: SwitchListTile(
                                    title: Text(e.text,style: TextStyle(color: Theme.of(context).primaryColor),),
                                    value: (e.actualState == e.positiveState),
                                    inactiveTrackColor: Colors.grey,
                                    onChanged: (bool value) {
                                      if (!value) {
                                        e.actualState = e.negativeState;
                                      } else {
                                        e.actualState = e.positiveState;
                                      }
                                      lisActions![index] = e;
                                      onChangeList(lisActions!);
                                    },
                                  ))),
                        )
                        .values
                        .toList() ??
                    [],
              ))),
    );
  }
}
