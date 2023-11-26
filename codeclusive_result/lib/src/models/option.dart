abstract class Option<S> {
  const Option();

  S? get valueOrNull;

  S get valueOrThrow;

  S valueOr(S defaultValue);

  bool get isSome;

  bool get isNone;

  R fold<R>(R Function(S p1) onSome, R Function() onNone);
}
