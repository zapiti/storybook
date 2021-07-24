String valueOr(Map<String, String> map, String value, String defaultValue) {
  if (map.containsKey(value)) {
    return map[value]!;
  }
  return defaultValue;
}
