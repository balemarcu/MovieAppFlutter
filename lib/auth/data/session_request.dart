import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_request.freezed.dart';
part 'session_request.g.dart';

@freezed
class SessionRequest with _$SessionRequest {
  factory SessionRequest({
    @JsonKey(name: 'session_id') required String value,
  }) = _SessionRequest;

  factory SessionRequest.fromJson(Map<String, dynamic> json) =>
      _$SessionRequestFromJson(json);
}
