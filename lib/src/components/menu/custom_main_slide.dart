import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook/src/presenter/module/home_cubit.dart';
import 'package:storybook/src/routes/constants_routes.dart';
import 'package:storybook/src/utils/utils.dart';

import '../../../storybook.dart';
import 'menu_widget.dart';

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class CustomMainSlide extends StatefulWidget {
  final Widget child;

  CustomMainSlide(this.child);

  @override
  _CustomMainSlideState createState() => _CustomMainSlideState();
}

class _CustomMainSlideState extends ModularState<CustomMainSlide, HomeCubit> {
  bool showCode = false;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, dynamic>(
          bloc: controller,
          builder: (context, state) => Stack(fit: StackFit.expand, children: [
                Material(child: LayoutBuilder(builder: (x, constraints) {
                  final isSmall = Utils.isSmalSize(constraints);

                  return Stack(
                    children: [
                      Row(children: [
                        SizedBox(
                          width: isSmall ? 228 : 0,
                        ),
                        Expanded(
                            child: Scaffold(
                          appBar: !isSmall
                              ? AppBar(
                                  title:
                                      Text(ConstantsRoutes.getCurrentTitle()),
                                  leading: IconButton(
                                    icon: Icon(Icons.menu),
                                    onPressed: () => openHideDrawer(),
                                  ),
                                )
                              : null,
                          key: _scaffoldKey,
                          body: Column(
                            children: [
                              Expanded(child: Center(child: widget.child)),
                              controller.currentModel != null && showCode
                                  ? DartPad(
                                      width: MediaQuery.of(context).size.width,
                                      listImport:
                                          controller.currentModel?.storyImports,
                                      key: Key(controller
                                          .currentModel!.storyDescription
                                          .toString()),
                                      stringCode:
                                          controller.currentModel!.storyCode ??
                                              controller.currentModel!.story
                                                  .toString(),
                                    )
                                  : SizedBox()
                            ],
                          ),
                          drawer: !isSmall
                              ? _slideMenu(
                                  context,
                                  isSmall,
                                  controller.filterList ?? [],
                                  controller.searchFilter)
                              : null,
                        )),
                        controller.currentModel == null
                            ? SizedBox()
                            : SizedBox(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Card(
                                        child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                showCode = !showCode;
                                              });
                                            },
                                            icon: Icon(
                                              !showCode
                                                  ? Icons.code
                                                  : Icons.code_off,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ))
                                      ],
                                    ))),
                              ),
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
                })),
              ])),
    );
  }

  MenuWidget _slideMenu(BuildContext _context, bool isSmall,
      List<StoryBookModel> listStoryBookModel, Function(String) searchMenu) {
    return MenuWidget(
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
