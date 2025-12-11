// NOTE:
// Class yang merepresentasikan kegagalan (failure) dalam aplikasi.
// Digunakan untuk menangani error secara terstruktur.

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}
