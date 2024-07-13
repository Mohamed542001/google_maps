import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/network_exceptions.dart';

part 'network_service.freezed.dart';

@freezed
sealed class NetworkService<T> with _$NetworkService<T> {
  const factory NetworkService.succeed(T data) = Succeed<T>;
  const factory NetworkService.failure(NetworkExceptions networkExceptions) =
      Failure<T>;
}
