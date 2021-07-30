import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storybook/src/model/story_book_model.dart';
import 'package:storybook/storybook.dart';

class HomeCubit extends Cubit {
  HomeCubit(this.listStoryBookModel) : super([]);

  List<StoryBookModel> listStoryBookModel;
  List<StoryActionModel>? listActions;

  List<StoryBookModel>? filterList;

  StoryBookModel? currentModel;
  Map<String, ThemeData> selectedThemeData = {'Default': ThemeData()};

  Map<String, CupertinoThemeData>? selectedCupertino;

  onChangeThemeData(Map<String, ThemeData> selected) {
    selectedThemeData = selected;
    emit(selectedThemeData);
  }

  onChangeList(List<StoryActionModel>? _listActions) {
    listActions = [..._listActions ?? []];
    emit(listActions);
  }

  setSelectedModel(StoryBookModel storyBookModel) {
    currentModel = storyBookModel;
    listActions = currentModel?.storyActions ?? [];
    emit(listActions);
    emit(currentModel);
  }

  void init() {
    filterList = [...listStoryBookModel];
    emit(filterList);
  }

  searchFilter(String search) {
    if (search.isEmpty) {
      init();
    } else {
      filterList = [
        ...listStoryBookModel
            .where((element) =>
                element.storyTitle
                    .toString()
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                element.storyDescription
                    .toString()
                    .toLowerCase()
                    .contains(search.toLowerCase()) ||
                (element.subStoryDescription ?? '')
                    .toString()
                    .toLowerCase()
                    .contains(search.toLowerCase()))
            .toList()
      ];
      emit(filterList);
    }
  }

  void onInitSelected(List<Map<String, ThemeData>> listThemeData) {
    if ((listThemeData).length > 1) onChangeThemeData(listThemeData.first);
  }
}
