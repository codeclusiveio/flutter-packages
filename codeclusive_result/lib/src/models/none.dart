import 'package:codeclusive_result/src/models/option.dart';

class None<S> implements Option<S> {
  const None();

  @override
  S? get valueOrNull => null;

  @override
  S get valueOrThrow => throw StateError('Option is None');

  @override
  S valueOr(S defaultValue) => defaultValue;

  @override
  bool get isSome => false;

  @override
  bool get isNone => true;

  @override
  R fold<R>(R Function(S p1) onSome, R Function() onNone) => onNone();

  @override
  bool operator ==(covariant None<S> other) {
    if (identical(this, other)) return true;

    return true;
  }

  @override
  String toString() => 'None()';

  @override
  int get hashCode => 0;
}
