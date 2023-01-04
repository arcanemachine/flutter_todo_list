//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyEmailRequest {
  /// Returns a new [VerifyEmailRequest] instance.
  VerifyEmailRequest({
    required this.key,
  });

  String key;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VerifyEmailRequest &&
     other.key == key;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key.hashCode);

  @override
  String toString() => 'VerifyEmailRequest[key=$key]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'key'] = this.key;
    return json;
  }

  /// Returns a new [VerifyEmailRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyEmailRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VerifyEmailRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VerifyEmailRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyEmailRequest(
        key: mapValueOfType<String>(json, r'key')!,
      );
    }
    return null;
  }

  static List<VerifyEmailRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VerifyEmailRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyEmailRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyEmailRequest> mapFromJson(dynamic json) {
    final map = <String, VerifyEmailRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyEmailRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyEmailRequest-objects as value to a dart map
  static Map<String, List<VerifyEmailRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VerifyEmailRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyEmailRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
  };
}

