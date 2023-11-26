abstract class CounterState{}

class ChangeCounterState extends CounterState{
  final int newCounter;

  ChangeCounterState(this.newCounter);
}

