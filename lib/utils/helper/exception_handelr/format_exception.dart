class TFormatException implements Exception {
  final String message;
  const TFormatException([this.message = 'Invalid format']);
}