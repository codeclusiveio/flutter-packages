import 'package:codeclusive_result/codeclusive_result.dart';

void main(List<String> arguments) {
  //Option is a type that can be Some or None you can use it to avoid null values
  Option<String> option;

  //you can set the value with the constructors
  option = Some("value");
  option = None();

  //or you can set some with extension
  option = "value".asSome();
  //there is no extension for none as it doesn't have a value
  option = None();

  //you can check if the option is some or none
  if (option.isSome) {
    //you can get the value with valueOrThrow
    option.valueOrThrow;
    //or with valueOrNull
    option.valueOrNull;
    //or with valueOr
    option.valueOr("default");
    //or with fold
    option.fold((value) => print(value), () => print("none"));
  }
  if (option.isNone) {
    //well, you can't get the value of none as it doesn't exist.
  }

  //Result is a type that can be Success or Failure you can use it to avoid throwing exceptions
  Result<int, String> result;

  //you can set the value with the constructors
  result = Success("Success");
  result = Failure(0);
  //or with extensions
  result = "Success".asSuccess();
  result = 0.asFailure();

  //you can check if the result is success or failure
  if (result.isSuccess) {
    //you can get the value with successOrThrow
    result.successOrThrow;
    //or with successOrNull
    result.successOrNull;
    //or with successOr
    result.successOr("failure");
    //or with fold
    result.fold((value) => print(value), id);
  }
  if (result.isFailure) {
    //you can get the value with failureOrThrow
    result.failureOrThrow;
    //or with failureOrNull
    result.failureOrNull;
    //or with failureOr
    result.failureOr(0);
    //or with fold
    result.fold(id, (value) => print(value));
  }

  //you can use the extension to convert a nullable value to an option
  String? nullable = "value";
  // ignore: unused_local_variable
  Option<String> optionFromNullable = nullable.asOption();

  //you can combine option with result
  // ignore: unused_local_variable
  Option<Result<String, Unit>> optionResult;

  //use the constructors to set the value
  optionResult = Some(Success(Unit()));
  optionResult = Some(Failure(""));
  optionResult = None();

  //or use the extensions
  //Unfortunately dart cannot infer the type of the result so you have to specify it
  optionResult = Unit.asSuccess<String>().asSome();
  optionResult = "failure".asFailure<Unit>().asSome();
  //or you can use the generic extension and construct the option yourself
  optionResult = Some(Unit.asSuccess());
  optionResult = Some("failure".asFailure());
}
