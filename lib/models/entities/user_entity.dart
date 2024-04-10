import 'package:package_name_manager/models/entities/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey()
  String? token;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
}