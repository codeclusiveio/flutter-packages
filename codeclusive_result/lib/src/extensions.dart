import 'package:codeclusive_result/codeclusive_result.dart';

extension CCResult<R extends Object> on R {
  Some<R> asSome() {
    //check if toSome is not performed on an instance of Option
    if (this is Some<R>) {
      return this as Some<R>;
    } else {
      return Some(this);
    }
  }

  Failure<R, S> asFailure<S extends Object>() {
    return Failure(this);
  }

  Success<F, R> asSuccess<F>() {
    return Success(this);
  }
}

extension NullableVariablesAsOption<R> on R? {
  Option<R> asOption() {
    if (this == null) {
      return const None();
    } else {
      return Some(this as R);
    }
  }
}
