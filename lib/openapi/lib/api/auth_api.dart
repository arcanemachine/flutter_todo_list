//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Check if a user is authenticated using session authentication.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> authCheckRetrieveWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/check/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Check if a user is authenticated using session authentication.
  Future<DrfAuthtoken?> authCheckRetrieve() async {
    final response = await authCheckRetrieveWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DrfAuthtoken',) as DrfAuthtoken;
    
    }
    return null;
  }

  /// Check if a user is authenticated using token authentication.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> authCheckTokenRetrieveWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/check/token/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Check if a user is authenticated using token authentication.
  Future<DrfAuthtoken?> authCheckTokenRetrieve() async {
    final response = await authCheckTokenRetrieveWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DrfAuthtoken',) as DrfAuthtoken;
    
    }
    return null;
  }

  /// Register a device with Firebase Cloud Messaging (FCM).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [GCMDeviceRequest] gCMDeviceRequest (required):
  Future<Response> authFcmCreateWithHttpInfo(GCMDeviceRequest gCMDeviceRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/fcm/';

    // ignore: prefer_final_locals
    Object? postBody = gCMDeviceRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Register a device with Firebase Cloud Messaging (FCM).
  ///
  /// Parameters:
  ///
  /// * [GCMDeviceRequest] gCMDeviceRequest (required):
  Future<void> authFcmCreate(GCMDeviceRequest gCMDeviceRequest,) async {
    final response = await authFcmCreateWithHttpInfo(gCMDeviceRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Register a device with Firebase Cloud Messaging (FCM).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [GCMDeviceRequest] gCMDeviceRequest (required):
  Future<Response> authFcmUpdateWithHttpInfo(GCMDeviceRequest gCMDeviceRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/fcm/';

    // ignore: prefer_final_locals
    Object? postBody = gCMDeviceRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Register a device with Firebase Cloud Messaging (FCM).
  ///
  /// Parameters:
  ///
  /// * [GCMDeviceRequest] gCMDeviceRequest (required):
  Future<void> authFcmUpdate(GCMDeviceRequest gCMDeviceRequest,) async {
    final response = await authFcmUpdateWithHttpInfo(gCMDeviceRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Login using session authentication.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  Future<Response> authLoginCreateWithHttpInfo(LoginRequest loginRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/login/';

    // ignore: prefer_final_locals
    Object? postBody = loginRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Login using session authentication.
  ///
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  Future<Login?> authLoginCreate(LoginRequest loginRequest,) async {
    final response = await authLoginCreateWithHttpInfo(loginRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Login',) as Login;
    
    }
    return null;
  }

  /// Login using token authentication.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///
  /// * [String] password (required):
  Future<Response> authLoginTokenCreateWithHttpInfo(String username, String password,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/login/token/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/x-www-form-urlencoded', 'multipart/form-data', 'application/json'];

    if (username != null) {
      formParams[r'username'] = parameterToString(username);
    }
    if (password != null) {
      formParams[r'password'] = parameterToString(password);
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Login using token authentication.
  ///
  /// Parameters:
  ///
  /// * [String] username (required):
  ///
  /// * [String] password (required):
  Future<AuthToken?> authLoginTokenCreate(String username, String password,) async {
    final response = await authLoginTokenCreateWithHttpInfo(username, password,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthToken',) as AuthToken;
    
    }
    return null;
  }

  /// Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> authLogoutCreateWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/logout/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.
  Future<RestAuthDetail?> authLogoutCreate() async {
    final response = await authLogoutCreateWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordChangeRequest] passwordChangeRequest (required):
  Future<Response> authPasswordChangeCreateWithHttpInfo(PasswordChangeRequest passwordChangeRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/password/change/';

    // ignore: prefer_final_locals
    Object? postBody = passwordChangeRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.
  ///
  /// Parameters:
  ///
  /// * [PasswordChangeRequest] passwordChangeRequest (required):
  Future<RestAuthDetail?> authPasswordChangeCreate(PasswordChangeRequest passwordChangeRequest,) async {
    final response = await authPasswordChangeCreateWithHttpInfo(passwordChangeRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordResetConfirmRequest] passwordResetConfirmRequest (required):
  Future<Response> authPasswordResetConfirmCreateWithHttpInfo(PasswordResetConfirmRequest passwordResetConfirmRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/password/reset/confirm/';

    // ignore: prefer_final_locals
    Object? postBody = passwordResetConfirmRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.
  ///
  /// Parameters:
  ///
  /// * [PasswordResetConfirmRequest] passwordResetConfirmRequest (required):
  Future<RestAuthDetail?> authPasswordResetConfirmCreate(PasswordResetConfirmRequest passwordResetConfirmRequest,) async {
    final response = await authPasswordResetConfirmCreateWithHttpInfo(passwordResetConfirmRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordResetRequest] passwordResetRequest (required):
  Future<Response> authPasswordResetCreateWithHttpInfo(PasswordResetRequest passwordResetRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/password/reset/';

    // ignore: prefer_final_locals
    Object? postBody = passwordResetRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.
  ///
  /// Parameters:
  ///
  /// * [PasswordResetRequest] passwordResetRequest (required):
  Future<RestAuthDetail?> authPasswordResetCreate(PasswordResetRequest passwordResetRequest,) async {
    final response = await authPasswordResetCreateWithHttpInfo(passwordResetRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/registration/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [RegisterRequest] registerRequest (required):
  Future<Response> authRegistrationCreateWithHttpInfo(RegisterRequest registerRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/registration/';

    // ignore: prefer_final_locals
    Object? postBody = registerRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [RegisterRequest] registerRequest (required):
  Future<Token?> authRegistrationCreate(RegisterRequest registerRequest,) async {
    final response = await authRegistrationCreateWithHttpInfo(registerRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Token',) as Token;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/registration/resend-email/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ResendEmailVerificationRequest] resendEmailVerificationRequest:
  Future<Response> authRegistrationResendEmailCreateWithHttpInfo({ ResendEmailVerificationRequest? resendEmailVerificationRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/registration/resend-email/';

    // ignore: prefer_final_locals
    Object? postBody = resendEmailVerificationRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ResendEmailVerificationRequest] resendEmailVerificationRequest:
  Future<RestAuthDetail?> authRegistrationResendEmailCreate({ ResendEmailVerificationRequest? resendEmailVerificationRequest, }) async {
    final response = await authRegistrationResendEmailCreateWithHttpInfo( resendEmailVerificationRequest: resendEmailVerificationRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/auth/registration/verify-email/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [VerifyEmailRequest] verifyEmailRequest (required):
  Future<Response> authRegistrationVerifyEmailCreateWithHttpInfo(VerifyEmailRequest verifyEmailRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/registration/verify-email/';

    // ignore: prefer_final_locals
    Object? postBody = verifyEmailRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [VerifyEmailRequest] verifyEmailRequest (required):
  Future<RestAuthDetail?> authRegistrationVerifyEmailCreate(VerifyEmailRequest verifyEmailRequest,) async {
    final response = await authRegistrationVerifyEmailCreateWithHttpInfo(verifyEmailRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RestAuthDetail',) as RestAuthDetail;
    
    }
    return null;
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PatchedUserDetailsRequest] patchedUserDetailsRequest:
  Future<Response> authUserPartialUpdateWithHttpInfo({ PatchedUserDetailsRequest? patchedUserDetailsRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/user/';

    // ignore: prefer_final_locals
    Object? postBody = patchedUserDetailsRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Parameters:
  ///
  /// * [PatchedUserDetailsRequest] patchedUserDetailsRequest:
  Future<UserDetails?> authUserPartialUpdate({ PatchedUserDetailsRequest? patchedUserDetailsRequest, }) async {
    final response = await authUserPartialUpdateWithHttpInfo( patchedUserDetailsRequest: patchedUserDetailsRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetails',) as UserDetails;
    
    }
    return null;
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> authUserRetrieveWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/user/';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  Future<UserDetails?> authUserRetrieve() async {
    final response = await authUserRetrieveWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetails',) as UserDetails;
    
    }
    return null;
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UserDetailsRequest] userDetailsRequest (required):
  Future<Response> authUserUpdateWithHttpInfo(UserDetailsRequest userDetailsRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/auth/user/';

    // ignore: prefer_final_locals
    Object? postBody = userDetailsRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
  ///
  /// Parameters:
  ///
  /// * [UserDetailsRequest] userDetailsRequest (required):
  Future<UserDetails?> authUserUpdate(UserDetailsRequest userDetailsRequest,) async {
    final response = await authUserUpdateWithHttpInfo(userDetailsRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetails',) as UserDetails;
    
    }
    return null;
  }
}
