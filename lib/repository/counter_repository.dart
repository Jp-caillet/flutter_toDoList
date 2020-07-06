class CounterRepository {

  int value = 0;

  static final CounterRepository _counterRepository = CounterRepository._internal();

  factory CounterRepository() {
    return _counterRepository;
  }

  CounterRepository._internal();
}