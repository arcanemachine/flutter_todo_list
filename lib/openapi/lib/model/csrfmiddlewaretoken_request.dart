//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CsrfmiddlewaretokenRequest {
  /// Returns a new [CsrfmiddlewaretokenRequest] instance.
  CsrfmiddlewaretokenRequest({
    required this.csrfmiddlewaretoken,
  });

  String csrfmiddlewaretoken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CsrfmiddlewaretokenRequest &&
     other.csrfmiddlewaretoken == csrfmiddlewaretoken;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (csrfmiddlewaretoken.hashCode);

  @override
  String toString() => 'CsrfmiddlewaretokenRequest[csrfmiddlewaretoken=$csrfmiddlewaretoken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'csrfmiddlewaretoken'] = this.csrfmiddlewaretoken;
    return json;
  }

  /// Returns a new [CsrfmiddlewaretokenRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CsrfmiddlewaretokenRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CsrfmiddlewaretokenRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CsrfmiddlewaretokenRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CsrfmiddlewaretokenRequest(
        csrfmiddlewaretoken: mapValueOfType<String>(json, r'csrfmiddlewaretoken')!,
      );
    }
    return null;
  }

  static List<CsrfmiddlewaretokenRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CsrfmiddlewaretokenRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CsrfmiddlewaretokenRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CsrfmiddlewaretokenRequest> mapFromJson(dynamic json) {
    final map = <String, CsrfmiddlewaretokenRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CsrfmiddlewaretokenRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CsrfmiddlewaretokenRequest-objects as value to a dart map
  static Map<String, List<CsrfmiddlewaretokenRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CsrfmiddlewaretokenRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CsrfmiddlewaretokenRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'csrfmiddlewaretoken',
  };
}

