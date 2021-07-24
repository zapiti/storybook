import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storybook/src/model/story_book_model.dart';

class HomeCubit extends Cubit {
  HomeCubit(this.listStoryBookModel) : super([]);

  List<StoryBookModel> listStoryBookModel;

  List<StoryBookModel>? filterList;

  StoryBookModel? currentModel;

  setSelectedModel(StoryBookModel storyBookModel) {
    currentModel = storyBookModel;
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
        ...filterList
                ?.where((element) =>
                    element.storyTitle
                        .toString()
                        .toLowerCase()
                        .contains(search.toLowerCase()) ||
                    element.storyDescription
                        .toString()
                        .toLowerCase()
                        .contains(search.toLowerCase()))
                .toList() ??
            []
      ];
      emit(filterList);
    }
  }
}
