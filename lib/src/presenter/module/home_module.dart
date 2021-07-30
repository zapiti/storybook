import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/model/story_book_model.dart';
import 'package:storybook/src/presenter/module/home_cubit.dart';
import 'package:storybook/src/routes/constants_routes.dart';

class HomeModule extends Module {
  final List<StoryBookModel> listStoryBookModel;
  final Widget? homeHistory;

  HomeModule(this.listStoryBookModel, this.homeHistory);

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => listStoryBookModel),
        Bind.lazySingleton((i) => HomeCubit(i.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) =>
                homeHistory ??
                Container(child: Center(child: Text('Select Story')))),
        ...listStoryBookModel
            .map<ChildRoute>((e) => ChildRoute("/" + ConstantsRoutes.getRouteByTitleAndDescription(e),
                child: (_, args) => e.story.builder(e.storyActions),
                transition: TransitionType.fadeIn))
            .toList()
      ];
}
