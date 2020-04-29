mixin UserUtils {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
}

extension StringUtils on String {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
}
