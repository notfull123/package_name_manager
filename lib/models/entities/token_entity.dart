import 'package:package_name_manager/models/entities/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  @JsonKey()
  String token;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  TokenEntity({this.token = '', this.refreshToken = ''});

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);
}
