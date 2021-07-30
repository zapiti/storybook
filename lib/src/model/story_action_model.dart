class StoryActionModel {
  String text;
  dynamic positiveState;
  dynamic negativeState;
  dynamic actualState;

  StoryActionModel(
      {required this.text,
      required this.positiveState,
      required this.negativeState,
      this.actualState});
}
