abstract class Result<T extends Object>{
  const Result();

  factory Result.ok(T value) = Ok<T>;
  factory Result.error(Exception error) = Error<T>;
} 

final class Ok<T extends Object> extends Result<T> {
  final T value;

  const Ok(this.value);
}

final class Error<T extends Object> extends Result<T>{

  final Exception error;

  const Error(this.error);  
}

extension ResultExtension on Object{
  Result ok(){
    return Result.ok(this);
  }
}

extension ResultErrorExtension on Exception {
  Result error() {
    return Result.error(this);
  }
}

extension ResultCasting<T extends Object> on Result<T> {
 Ok<T> get asOk => this as Ok<T>;
  Error<T> get asError => this as Error<T>;
}