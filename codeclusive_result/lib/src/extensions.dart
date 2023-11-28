import 'package:codeclusive_result/codeclusive_result.dart';

extension CCResult<R extends Object> on R {
  ///Wraps the value in a [Some] instance
  Some<R> asSome() {
    //check if toSome is not performed on an instance of Option
    if (this is Some<R>) {
      return this as Some<R>;
    } else {
      return Some(this);
    }
  }

  ///Wraps the value in a [Failure] instance
  Failure<R, S> asFailure<S extends Object>() {
    return Failure(this);
  }

  ///Wraps the value in a [Success] instance
  Success<F, R> asSuccess<F>() {
    return Success(this);
  }
}

extension NullableVariablesAsOption<R> on R? {
  ///Converts a nullable variable to an [Option] instance with [Some] or [None] value
  Option<R> asOption() {
    if (this == null) {
      return const None();
    } else {
      return Some(this as R);
    }
  }
}
