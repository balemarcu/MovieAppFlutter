import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_request.freezed.dart';
part 'token_request.g.dart';

@freezed
class TokenRequest with _$TokenRequest {
  const factory TokenRequest({
    required String value,
    required String expiring_date,
  }) = _TokenRequest;

  factory TokenRequest.fromJson(Map<String, Object?> json) =>
      _$TokenRequestFromJson(json);
}
