//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PasswordResetConfirmRequest {
  /// Returns a new [PasswordResetConfirmRequest] instance.
  PasswordResetConfirmRequest({
    required this.newPassword1,
    required this.newPassword2,
    required this.uid,
    required this.token,
  });

  String newPassword1;

  String newPassword2;

  String uid;

  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PasswordResetConfirmRequest &&
     other.newPassword1 == newPassword1 &&
     other.newPassword2 == newPassword2 &&
     other.uid == uid &&
     other.token == token;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (newPassword1.hashCode) +
    (newPassword2.hashCode) +
    (uid.hashCode) +
    (token.hashCode);

  @override
  String toString() => 'PasswordResetConfirmRequest[newPassword1=$newPassword1, newPassword2=$newPassword2, uid=$uid, token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'new_password1'] = this.newPassword1;
      json[r'new_password2'] = this.newPassword2;
      json[r'uid'] = this.uid;
      json[r'token'] = this.token;
    return json;
  }

  /// Returns a new [PasswordResetConfirmRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PasswordResetConfirmRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PasswordResetConfirmRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PasswordResetConfirmRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PasswordResetConfirmRequest(
        newPassword1: mapValueOfType<String>(json, r'new_password1')!,
        newPassword2: mapValueOfType<String>(json, r'new_password2')!,
        uid: mapValueOfType<String>(json, r'uid')!,
        token: mapValueOfType<String>(json, r'token')!,
      );
    }
    return null;
  }

  static List<PasswordResetConfirmRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PasswordResetConfirmRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasswordResetConfirmRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PasswordResetConfirmRequest> mapFromJson(dynamic json) {
    final map = <String, PasswordResetConfirmRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PasswordResetConfirmRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PasswordResetConfirmRequest-objects as value to a dart map
  static Map<String, List<PasswordResetConfirmRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PasswordResetConfirmRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PasswordResetConfirmRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'new_password1',
    'new_password2',
    'uid',
    'token',
  };
}

