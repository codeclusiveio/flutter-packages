/// Let's use`ignore_for_file: avoid_print` to suppress lint warning for whole file
/// Every single print statement in this file would normally show lint error
// ignore_for_file: avoid_print

void main() {
  print('This is example of Codeclusive Lints');

  String messageBase = '';

  /// Due Codeclusive lints we should use single quotes for declaring Strings
  /// Let's use`ignore: prefer_single_quotes` to suppress lint warning
  /// Following line would normally show lint warning
  messageBase += "Hello"; // ignore: prefer_single_quotes
  print(messageBase);

  /// Due Codeclusive lints we should avoid using vars. It also dictate us to start using string buffers.
  /// Let's use`ignore: prefer_final_locals` to suppress lint warning and use var
  /// Let's use`ignore: use_string_buffers` to suppress lint warning and use string concatenation
  /// Following line would normally show lint warning
  var secondMessage =
      'This is concatenated string: '; // ignore: prefer_final_locals

  List<String> stringsToAdd = [
    'Hello',
    'there',
    'fellow',
    'flutter',
    'programmer'
  ];

  for (final element in stringsToAdd) {
    secondMessage += element + ' '; // ignore: use_string_buffers
  }

  print(secondMessage);
}
