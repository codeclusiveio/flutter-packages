void main() {
  // Below declaration whould normally show linter warning, one can disable such warning by adding line ignore as below...
  // ignore: prefer_final_locals
  var number = 1;

  // ... or by adding ignores for the whole file as show below.
  // ignore_for_file: curly_braces_in_flow_control_structures, avoid_empty_else, avoid_print, empty_statements
  if (number > 1)
    print('A');
  else
    ;
}
