//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/todos_api.dart';
part 'api/utils_api.dart';

part 'model/auth_token.dart';
part 'model/auth_token_request.dart';
part 'model/csrfmiddlewaretoken.dart';
part 'model/csrfmiddlewaretoken_request.dart';
part 'model/login.dart';
part 'model/login_request.dart';
part 'model/password_change_request.dart';
part 'model/password_reset_confirm_request.dart';
part 'model/password_reset_request.dart';
part 'model/patched_todo_request.dart';
part 'model/patched_user_details_request.dart';
part 'model/register_request.dart';
part 'model/resend_email_verification_request.dart';
part 'model/rest_auth_detail.dart';
part 'model/todo.dart';
part 'model/todo_request.dart';
part 'model/token.dart';
part 'model/user_details.dart';
part 'model/user_details_request.dart';
part 'model/verify_email_request.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
