abstract class Failure<T> {
  final T message;

  Failure(this.message);
}

class ServerFailure extends Failure<String> {
  ServerFailure(super.message);
}
