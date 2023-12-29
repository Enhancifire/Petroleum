import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

part 'profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    int? id,
    String? firstName,
    String? lastName,
    String? userId,
    String? profilePictureUrl,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

extension ProfileUtils on UserProfileModel {
  Map<String, dynamic> extJson() {
    final map = <String, dynamic>{
      "userId": userId,
      "firstName": firstName,
      "lastName": lastName,
      "profilePictureUrl": profilePictureUrl
    };

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  bool get isComplete {
    if (firstName == null || lastName == null || profilePictureUrl == null) {
      return false;
    } else {
      return true;
    }
  }
}
