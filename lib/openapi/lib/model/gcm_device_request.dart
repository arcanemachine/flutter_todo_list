//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GCMDeviceRequest {
  /// Returns a new [GCMDeviceRequest] instance.
  GCMDeviceRequest({
    required this.registrationId,
  });

  String registrationId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GCMDeviceRequest &&
     other.registrationId == registrationId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (registrationId.hashCode);

  @override
  String toString() => 'GCMDeviceRequest[registrationId=$registrationId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'registration_id'] = this.registrationId;
    return json;
  }

  /// Returns a new [GCMDeviceRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GCMDeviceRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GCMDeviceRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GCMDeviceRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GCMDeviceRequest(
        registrationId: mapValueOfType<String>(json, r'registration_id')!,
      );
    }
    return null;
  }

  static List<GCMDeviceRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GCMDeviceRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GCMDeviceRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GCMDeviceRequest> mapFromJson(dynamic json) {
    final map = <String, GCMDeviceRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GCMDeviceRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GCMDeviceRequest-objects as value to a dart map
  static Map<String, List<GCMDeviceRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GCMDeviceRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GCMDeviceRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'registration_id',
  };
}

