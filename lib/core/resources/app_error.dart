class AppError implements Exception {
  final String message;
  const AppError({this.message = "Unknown error occured!"});
}
