import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/components/code_pad/code_pad.dart';
import 'package:storybook/src/presenter/module/component/dropdown_theme.dart';
import 'package:storybook/src/presenter/module/component/states_list_widget.dart';
import 'package:storybook/src/presenter/module/home_cubit.dart';
import 'package:storybook/src/routes/constants_routes.dart';
import 'package:storybook/src/utils/utils.dart';

import '../../../storybook.dart';
import 'menu_widget.dart';

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class CustomMainSlide extends StatefulWidget {
  final Widget child;
  final List<Map<String, ThemeData>> listThemeData;
  final String title;
  final List<Locale> supportedLocales;
  final Widget logo;

  CustomMainSlide(
      {required this.child,
      required this.listThemeData,
      required this.title,
      required this.supportedLocales,
      required this.logo});

  @override
  _CustomMainSlideState createState() => _CustomMainSlideState();
}

class _CustomMainSlideState extends ModularState<CustomMainSlide, HomeCubit> {
  @override
  void initState() {
    super.initState();
    controller.init();
    controller.onInitSelected(widget.listThemeData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, dynamic>(
      bloc: controller,
      builder: (ctx, state) => MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: widget.supportedLocales,
          theme: controller.selectedThemeData.values.first,
          debugShowCheckedModeBanner: false,
          title: widget.title,
          home: Scaffold(
            body: LayoutBuilder(builder: (x, constraints) {
              final isSmall = Utils.isSmalSize(constraints);

              return Stack(
                children: [
                  Row(children: [
                    SizedBox(
                      width: Utils.isSmalSize(constraints) ? 228 : 0,
                    ),
                    Expanded(
                        child: Scaffold(
                      appBar: AppBar(
                        title: Text(ConstantsRoutes.getCurrentTitle(
                            controller.currentModel)),
                        centerTitle: false,
                        leading: isSmall
                            ? null
                            : IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () => openHideDrawer(),
                              ),
                        elevation: 0,
                        actions: [
                          widget.listThemeData.length <= 1
                              ? SizedBox()
                              : DropdownTheme(
                                  lisTheme: widget.listThemeData,
                                  selected: controller.selectedThemeData,
                                  callback: controller.onChangeThemeData,
                                )
                        ],
                      ),
                      key: _scaffoldKey,
                      body: controller.currentModel == null
                          ? Center(
                              child: widget.child,
                            )
                          : CodePad(
                              child: Column(children: [
                                StatesListWidget(
                                  onChangeList: controller.onChangeList,
                                  lisActions: controller.listActions ?? [],
                                ),
                                Expanded(
                                    child: Center(
                                        child: controller
                                                .currentModel?.story.builder
                                                .call(controller.listActions) ??
                                            SizedBox()))
                              ]),
                              sourceStoryFilePath: controller
                                      .currentModel?.sourceStoryFilePath ??
                                  '',
                              syntaxHighlighterStyle: controller
                                  .currentModel?.syntaxHighlighterStyle,
                            ),
                      drawer: !isSmall
                          ? _slideMenu(
                              context,
                              isSmall,
                              controller.filterList ?? [],
                              controller.searchFilter)
                          : null,
                    )),
                  ]),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: isSmall
                          ? _slideMenu(
                              context,
                              isSmall,
                              controller.filterList ?? [],
                              controller.searchFilter)
                          : SizedBox()),
                ],
              );
            }),
          )),
    );
  }

  MenuWidget _slideMenu(BuildContext _context, bool isSmall,
      List<StoryBookModel> listStoryBookModel, Function(String) searchMenu) {
    return MenuWidget(
      logo: widget.logo,
      onItemClick: (storyBookModel) {
        setState(() {});
        openHideDrawer();
        controller.setSelectedModel(storyBookModel);
      },
      listStoryBookModel: listStoryBookModel,
      searchMenu: searchMenu,
    );
  }
}

void openHideDrawer() {
  if (_scaffoldKey.currentState != null) if (_scaffoldKey
      .currentState!.isDrawerOpen) {
    _scaffoldKey.currentState!.openEndDrawer();
  } else {
    _scaffoldKey.currentState!.openDrawer();
  }
}
