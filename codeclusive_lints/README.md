## Features

codeclusive-lints provides a list of rules for Dart and Flutter created and used by Codeclusive.io.
Includes flutter-lints and custom set of rules created from [dart linter rules](https://dart.dev/tools/linter-rules)

## Requirements
- Flutter 3.10.4
- Dart 3.0.3

## Usage
To use lints please add following line to the proper files:

pubspec.yaml:
```dependencies:
codeclusive_lints: ^0.0.1
```

analysis_options.yaml
```include: package:codeclusive_lints/analysis_options.yaml```

## Used rules:
### Errors
- [todo](https://dart.dev/tools/diagnostic-messages): ignore
- [prefer_const_constructors](https://dart.dev/tools/linter-rules/prefer_const_constructors): info
- [missing_required_param](https://dart.dev/tools/diagnostic-messages): error
- [missing_return](https://dart.dev/tools/diagnostic-messages): error
- [must_be_immutable](https://dart.dev/tools/diagnostic-messages): error
- [unnecessary_const](https://dart.dev/tools/linter-rules/unnecessary_const): error

### Lints
- [unnecessary_await_in_return](https://dart.dev/tools/linter-rules/unnecessary_await_in_return)
- [unnecessary_null_checks](https://dart.dev/tools/linter-rules/unnecessary_null_checks)
- [unnecessary_overrides](https://dart.dev/tools/linter-rules/unnecessary_overrides)
- [unnecessary_parenthesis](https://dart.dev/tools/linter-rules/unnecessary_parenthesis)
- [unnecessary_raw_strings](https://dart.dev/tools/linter-rules/unnecessary_raw_strings)
- [unnecessary_statements](https://dart.dev/tools/linter-rules/unnecessary_statements)
- [unrelated_type_equality_checks](https://dart.dev/tools/linter-rules/unrelated_type_equality_checks)
- [tighten_type_of_initializing_formals](https://dart.dev/tools/linter-rules/tighten_type_of_initializing_formals)
- [always_declare_return_types](https://dart.dev/tools/linter-rules/always_declare_return_types)
- [avoid_catching_errors](https://dart.dev/tools/linter-rules/avoid_catching_errors)
- [avoid_empty_else](https://dart.dev/tools/linter-rules/avoid_empty_else)
- [empty_catches](https://dart.dev/tools/linter-rules/empty_catches)
- [iterable_contains_unrelated_type](https://dart.dev/tools/linter-rules/iterable_contains_unrelated_type)
- [list_remove_unrelated_type](https://dart.dev/tools/linter-rules/list_remove_unrelated_type)
- [missing_whitespace_between_adjacent_strings](https://dart.dev/tools/linter-rules/missing_whitespace_between_adjacent_strings)
- [camel_case_extensions](https://dart.dev/tools/linter-rules/camel_case_extensions)
- [camel_case_types](https://dart.dev/tools/linter-rules/camel_case_types)
- [file_names](https://dart.dev/tools/linter-rules/file_names)
- [leading_newlines_in_multiline_strings](https://dart.dev/tools/linter-rules/leading_newlines_in_multiline_strings)
- [prefer_final_in_for_each](https://dart.dev/tools/linter-rules/prefer_final_in_for_each)
- [prefer_final_locals](https://dart.dev/tools/linter-rules/prefer_final_locals)
- [sized_box_shrink_expand](https://dart.dev/tools/linter-rules/sized_box_shrink_expand)
- [prefer_is_empty](https://dart.dev/tools/linter-rules/prefer_is_empty)
- [prefer_is_not_empty](https://dart.dev/tools/linter-rules/prefer_is_not_empty)
- [prefer_iterable_whereType](https://dart.dev/tools/linter-rules/prefer_iterable_whereType)
- [prefer_null_aware_method_calls](https://dart.dev/tools/linter-rules/prefer_null_aware_method_calls)
- [sort_constructors_first](https://dart.dev/tools/linter-rules/sort_constructors_first)
- [sort_pub_dependencies](https://dart.dev/tools/linter-rules/sort_pub_dependencies)
- [always_use_package_imports](https://dart.dev/tools/linter-rules/always_use_package_imports)
- [avoid_redundant_argument_values](https://dart.dev/tools/linter-rules/avoid_redundant_argument_values)
- [avoid_relative_lib_imports](https://dart.dev/tools/linter-rules/avoid_relative_lib_imports)
- [avoid_returning_this](https://dart.dev/tools/linter-rules/avoid_returning_this)
- [avoid_shadowing_type_parameters](https://dart.dev/tools/linter-rules/avoid_shadowing_type_parameters)
- [avoid_slow_async_io](https://dart.dev/tools/linter-rules/avoid_slow_async_io)
- [avoid_types_as_parameter_names](https://dart.dev/tools/linter-rules/avoid_types_as_parameter_names)
- [avoid_unused_constructor_parameters](https://dart.dev/tools/linter-rules/avoid_unused_constructor_parameters)
- [avoid_void_async](https://dart.dev/tools/linter-rules/avoid_void_async)
- [await_only_futures](https://dart.dev/tools/linter-rules/await_only_futures)
- [cancel_subscriptions](https://dart.dev/tools/linter-rules/cancel_subscriptions)
- [comment_references](https://dart.dev/tools/linter-rules/comment_references)
- [curly_braces_in_flow_control_structures](https://dart.dev/tools/linter-rules/curly_braces_in_flow_control_structures)
- [directives_ordering](https://dart.dev/tools/linter-rules/directives_ordering)
- [flutter_style_todos](https://dart.dev/tools/linter-rules/flutter_style_todos)
- [join_return_with_assignment](https://dart.dev/tools/linter-rules/join_return_with_assignment)
- [no_adjacent_strings_in_list](https://dart.dev/tools/linter-rules/no_adjacent_strings_in_list)
- [no_default_cases](https://dart.dev/tools/linter-rules/no_default_cases)
- [no_duplicate_case_values](https://dart.dev/tools/linter-rules/no_duplicate_case_values)
- [no_runtimeType_toString](https://dart.dev/tools/linter-rules/no_runtimeType_toString)
- [noop_primitive_operations](https://dart.dev/tools/linter-rules/noop_primitive_operations)
- [null_check_on_nullable_type_parameter](https://dart.dev/tools/linter-rules/null_check_on_nullable_type_parameter)
- [one_member_abstracts](https://dart.dev/tools/linter-rules/one_member_abstracts)
- [only_throw_errors](https://dart.dev/tools/linter-rules/only_throw_errors)
- [package_prefixed_library_names](https://dart.dev/tools/linter-rules/package_prefixed_library_names)
- [parameter_assignments](https://dart.dev/tools/linter-rules/parameter_assignments)
- [prefer_asserts_in_initializer_lists](https://dart.dev/tools/linter-rules/prefer_asserts_in_initializer_lists)
- [prefer_asserts_with_message](https://dart.dev/tools/linter-rules/prefer_asserts_with_message)
- [prefer_constructors_over_static_methods](https://dart.dev/tools/linter-rules/prefer_constructors_over_static_methods)
- [prefer_generic_function_type_aliases](https://dart.dev/tools/linter-rules/prefer_generic_function_type_aliases)
- [prefer_if_elements_to_conditional_expressions](https://dart.dev/tools/linter-rules/prefer_if_elements_to_conditional_expressions)
- [prefer_int_literals](https://dart.dev/tools/linter-rules/prefer_int_literals)
- [prefer_single_quotes](https://dart.dev/tools/linter-rules/prefer_single_quotes)
- [prefer_typing_uninitialized_variables](https://dart.dev/tools/linter-rules/prefer_typing_uninitialized_variables)
- [require_trailing_commas](https://dart.dev/tools/linter-rules/require_trailing_commas)
- [sort_unnamed_constructors_first](https://dart.dev/tools/linter-rules/sort_unnamed_constructors_first)
- [test_types_in_equals](https://dart.dev/tools/linter-rules/test_types_in_equals)
- [throw_in_finally](https://dart.dev/tools/linter-rules/throw_in_finally)
- [type_annotate_public_apis](https://dart.dev/tools/linter-rules/type_annotate_public_apis)
- [use_is_even_rather_than_modulo](https://dart.dev/tools/linter-rules/use_is_even_rather_than_modulo)
- [use_late_for_private_fields_and_variables](https://dart.dev/tools/linter-rules/use_late_for_private_fields_and_variables)
- [use_named_constants](https://dart.dev/tools/linter-rules/use_named_constants)
- [use_string_buffers](https://dart.dev/tools/linter-rules/use_string_buffers)
- [use_to_and_as_if_applicable](https://dart.dev/tools/linter-rules/use_to_and_as_if_applicable)
- [valid_regexps](https://dart.dev/tools/linter-rules/valid_regexps)
- [void_checks](https://dart.dev/tools/linter-rules/void_checks)
- [use_colored_box](https://dart.dev/tools/linter-rules/use_colored_box)
- [use_super_parameters](https://dart.dev/tools/linter-rules/use_super_parameters)
- [unawaited_futures](https://dart.dev/tools/linter-rules/unawaited_futures)
- [cast_nullable_to_non_nullable](https://dart.dev/tools/linter-rules/cast_nullable_to_non_nullable)
- [unnecessary_lambdas](https://dart.dev/tools/linter-rules/unnecessary_lambdas)


## License
Copyright (c) 2023, Codeclusive. Use of this source code is governed by a MIT license that can be found in the LICENSE file.