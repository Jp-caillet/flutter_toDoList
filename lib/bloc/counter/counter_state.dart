class CounterState {}

class UninitializedCounterState extends CounterState {}

class HasValueCounterState extends CounterState {
  int value;

  HasValueCounterState(this.value);
}
