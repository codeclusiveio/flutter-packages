// Let's use`ignore_for_file: avoid_print` to suppress lint warning for whole file
// Every single print statement in this file would normally show lint error
// ignore_for_file: avoid_print

void main() {
  print('This is example of Codeclusive Lints');
  print('Ignored lints for this file: avoid_print');
  String messageBase = '';

  // Due Codeclusive lints we should use single quotes for declaring Strings
  // Let's use`ignore: prefer_single_quotes` to suppress lint warning
  // Following line would normally show lint warning
  messageBase += "Hello"; // ignore: prefer_single_quotes
  print('\nIgnored lints: prefer_single_quotes');
  print(messageBase);

  // Due Codeclusive lints we should avoid using vars. It also dictate us to start using string buffers.
  // Let's use`ignore: prefer_final_locals` to suppress lint warning and use var
  // Let's use`ignore: use_string_buffers` to suppress lint warning and use string concatenation
  // Following line would normally show lint warning
  var secondMessage =
      'This is concatenated string: '; // ignore: prefer_final_locals

  final List<String> stringsToAdd = [
    'Hello',
    'there',
    'fellow',
    'flutter',
    'programmer'
  ];

  for (final element in stringsToAdd) {
    // ignore: use_string_buffers, unnecessary_brace_in_string_interps
    secondMessage += '${element} ';
  }

  print(
    '\nIgnored lints: prefer_final_locals, use_string_buffers, unnecessary_brace_in_string_interps',
  );
  print(secondMessage);

  bool? nullValue = null; // ignore: avoid_init_to_null, prefer_final_locals
  print('\nIgnored lints: avoid_init_to_null, prefer_final_locals');
  print('nullValue = $nullValue');

  print('\nIgnored lints: require_trailing_commas');
  print(
      'End of the very short example with very long and boring text to see if the lints works fine with this example code we\'ve created'); // ignore: require_trailing_commas
}
