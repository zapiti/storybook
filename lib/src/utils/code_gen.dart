

String codeGen({required String stringCode, required List<String> listImport}) {
  return listImport.join("\n") +
      ("""\n\n$stringCode""");
}
