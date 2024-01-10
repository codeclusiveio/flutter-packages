# Codeclusive_result

`Codeclusive_result` is a Dart package inspired by [dartz](https://pub.dev/packages/dartz) and [result_dart](https://pub.dev/packages/result_dart). It offers enhanced functionality for handling optional values and operation results through `Option` and `Result` types, alongside the `Unit` type and `id` function for functional programming paradigms in Dart.

## Features

- **Option Type**: Safely manage the presence or absence of values.
- **Result Type**: Express operation results as either `Success` or `Failure`.
- **Unit Type**: Represent the absence of a specific value, can be used instead of `void`.
- **Id Function**: A utility for functional composition, it returns the value that is provided in the function passed to it.

## Requirements
- Flutter >=1.17.0

## Installation

Add `Codeclusive_result` to your Dart project's `pubspec.yaml` file:

```yaml
dependencies:
  codeclusive_result: ^0.0.2
```

# Usage

## Option

```dart
Option<String> option;

// Using constructors
option = Some("value");
option = None();

// Using extensions
option = "value".asSome();
option = None();

// Handling values
if (option.isSome) {
  // Accessing value
  print(option.valueOr("default"));
}

if (option.isNone) {
  // Handle absence of value
}

// Convert nullable to Option
String? nullable = "value";
Option<String> optionFromNullable = nullable.asOption();
```

## Result 

```dart
Result<int, String> result;

// Using constructors
result = Success("Success");
result = Failure(0);

// Handling results
if (result.isSuccess) {
  // Accessing success value
  print(result.successOrNull ?? "Default success value");
  // or
  print(result.successOrThrow);
}

if (result.isFailure) {
  // Accessing failure value
  print(result.failureOrNull ?? "Default failure value");
  // or
  print(result.failureOrThrow);
}

// Using extensions
result = "Success".asSuccess();
result = 0.asFailure();
```

## Handling type inheritance issue when using Option of Result with extensions.

```dart
Option<Result<Exception, String>> optionResult;
//you need to provide the "failure" type here.
optionResult = "success".asSuccess<Exception>().asSome();

Result<Exception, String> result;
//you don't need to provide anything here as dart can guess it
result = 'success'.asSuccess();
```

## Unit
Unit can be used when you want to return a void in result
```dart
Result<Exception,Unit> result;

result = Success(Unit());
//or
result = Unit.asSuccess();
```
## Id 
id is most useful in fold methods. It returns the argument passed to the function.

```dart
//this will return the value of Success if the result is Success.
final successValue = result.fold((f) => throw Exception(failure), id);
```

## License
Copyright (c) 2023, Codeclusive. Use of this source code is governed by a MIT license that can be found in the LICENSE file.
