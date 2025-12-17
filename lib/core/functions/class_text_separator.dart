List classTextSeparator(String className) {
  final parts = className.split(' - ');
  final classNameSeparated = [parts[0], parts[1]];
  return classNameSeparated;
}
