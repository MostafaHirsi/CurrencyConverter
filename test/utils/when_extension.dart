import 'package:mockito/mockito.dart';

extension When<T> on PostExpectation<T> {
  void thenAnswerOneByOne(List<T> args) {
    assert(args.isNotEmpty, 'Argument list should not be empty!');
    thenAnswer((_) => 1 == args.length ? args[0] : args.removeAt(0));
  }
}
