import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_demo/bloc/counter/counter_state.dart';
import 'package:flutter_bloc_demo/repository/counter_repository.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    CounterRepository counterRepository = CounterRepository();

    if (event is IncrementCounter) {
      counterRepository.value = counterRepository.value + 1;
      yield HasValueCounterState(counterRepository.value);
    } else if (event is DecrementCounter) {
      counterRepository.value = counterRepository.value - 1;
      yield HasValueCounterState(counterRepository.value);
    } else if (event is ResetEvent) {
      yield UninitializedCounterState();
    }
  }
}
