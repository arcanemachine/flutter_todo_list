# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authCheckRetrieve**](AuthApi.md#authcheckretrieve) | **GET** /api/auth/check/ | 
[**authCheckTokenRetrieve**](AuthApi.md#authchecktokenretrieve) | **GET** /api/auth/check/token/ | 
[**authFcmCreate**](AuthApi.md#authfcmcreate) | **POST** /api/auth/fcm/ | 
[**authFcmUpdate**](AuthApi.md#authfcmupdate) | **PUT** /api/auth/fcm/ | 
[**authLoginCreate**](AuthApi.md#authlogincreate) | **POST** /api/auth/login/ | 
[**authLoginTokenCreate**](AuthApi.md#authlogintokencreate) | **POST** /api/auth/login/token/ | 
[**authLogoutCreate**](AuthApi.md#authlogoutcreate) | **POST** /api/auth/logout/ | 
[**authPasswordChangeCreate**](AuthApi.md#authpasswordchangecreate) | **POST** /api/auth/password/change/ | 
[**authPasswordResetConfirmCreate**](AuthApi.md#authpasswordresetconfirmcreate) | **POST** /api/auth/password/reset/confirm/ | 
[**authPasswordResetCreate**](AuthApi.md#authpasswordresetcreate) | **POST** /api/auth/password/reset/ | 
[**authRegistrationCreate**](AuthApi.md#authregistrationcreate) | **POST** /api/auth/registration/ | 
[**authRegistrationResendEmailCreate**](AuthApi.md#authregistrationresendemailcreate) | **POST** /api/auth/registration/resend-email/ | 
[**authRegistrationVerifyEmailCreate**](AuthApi.md#authregistrationverifyemailcreate) | **POST** /api/auth/registration/verify-email/ | 
[**authUserPartialUpdate**](AuthApi.md#authuserpartialupdate) | **PATCH** /api/auth/user/ | 
[**authUserRetrieve**](AuthApi.md#authuserretrieve) | **GET** /api/auth/user/ | 
[**authUserUpdate**](AuthApi.md#authuserupdate) | **PUT** /api/auth/user/ | 


# **authCheckRetrieve**
> DrfAuthtoken authCheckRetrieve()



Check if a user is authenticated using session authentication.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.authCheckRetrieve();
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authCheckRetrieve: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DrfAuthtoken**](DrfAuthtoken.md)

### Authorization

[cookieAuth](../README.md#cookieAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authCheckTokenRetrieve**
> DrfAuthtoken authCheckTokenRetrieve()



Check if a user is authenticated using token authentication.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.authCheckTokenRetrieve();
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authCheckTokenRetrieve: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DrfAuthtoken**](DrfAuthtoken.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authFcmCreate**
> authFcmCreate(gCMDeviceRequest)



Register a device with Firebase Cloud Messaging (FCM).

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final gCMDeviceRequest = GCMDeviceRequest(); // GCMDeviceRequest | 

try {
    api_instance.authFcmCreate(gCMDeviceRequest);
} catch (e) {
    print('Exception when calling AuthApi->authFcmCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gCMDeviceRequest** | [**GCMDeviceRequest**](GCMDeviceRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authFcmUpdate**
> authFcmUpdate(gCMDeviceRequest)



Register a device with Firebase Cloud Messaging (FCM).

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final gCMDeviceRequest = GCMDeviceRequest(); // GCMDeviceRequest | 

try {
    api_instance.authFcmUpdate(gCMDeviceRequest);
} catch (e) {
    print('Exception when calling AuthApi->authFcmUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gCMDeviceRequest** | [**GCMDeviceRequest**](GCMDeviceRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLoginCreate**
> Login authLoginCreate(loginRequest)



Login using session authentication.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final loginRequest = LoginRequest(); // LoginRequest | 

try {
    final result = api_instance.authLoginCreate(loginRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authLoginCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**Login**](Login.md)

### Authorization

[cookieAuth](../README.md#cookieAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLoginTokenCreate**
> AuthToken authLoginTokenCreate(username, password)



Login using token authentication.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final username = username_example; // String | 
final password = password_example; // String | 

try {
    final result = api_instance.authLoginTokenCreate(username, password);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authLoginTokenCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | 
 **password** | **String**|  | 

### Return type

[**AuthToken**](AuthToken.md)

### Authorization

[tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data, application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLogoutCreate**
> RestAuthDetail authLogoutCreate()



Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.authLogoutCreate();
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authLogoutCreate: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RestAuthDetail**](RestAuthDetail.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authPasswordChangeCreate**
> RestAuthDetail authPasswordChangeCreate(passwordChangeRequest)



Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final passwordChangeRequest = PasswordChangeRequest(); // PasswordChangeRequest | 

try {
    final result = api_instance.authPasswordChangeCreate(passwordChangeRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authPasswordChangeCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordChangeRequest** | [**PasswordChangeRequest**](PasswordChangeRequest.md)|  | 

### Return type

[**RestAuthDetail**](RestAuthDetail.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authPasswordResetConfirmCreate**
> RestAuthDetail authPasswordResetConfirmCreate(passwordResetConfirmRequest)



Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final passwordResetConfirmRequest = PasswordResetConfirmRequest(); // PasswordResetConfirmRequest | 

try {
    final result = api_instance.authPasswordResetConfirmCreate(passwordResetConfirmRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authPasswordResetConfirmCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetConfirmRequest** | [**PasswordResetConfirmRequest**](PasswordResetConfirmRequest.md)|  | 

### Return type

[**RestAuthDetail**](RestAuthDetail.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authPasswordResetCreate**
> RestAuthDetail authPasswordResetCreate(passwordResetRequest)



Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final passwordResetRequest = PasswordResetRequest(); // PasswordResetRequest | 

try {
    final result = api_instance.authPasswordResetCreate(passwordResetRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authPasswordResetCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetRequest** | [**PasswordResetRequest**](PasswordResetRequest.md)|  | 

### Return type

[**RestAuthDetail**](RestAuthDetail.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegistrationCreate**
> Token authRegistrationCreate(registerRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final registerRequest = RegisterRequest(); // RegisterRequest | 

try {
    final result = api_instance.authRegistrationCreate(registerRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authRegistrationCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerRequest** | [**RegisterRequest**](RegisterRequest.md)|  | 

### Return type

[**Token**](Token.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegistrationResendEmailCreate**
> RestAuthDetail authRegistrationResendEmailCreate(resendEmailVerificationRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final resendEmailVerificationRequest = ResendEmailVerificationRequest(); // ResendEmailVerificationRequest | 

try {
    final result = api_instance.authRegistrationResendEmailCreate(resendEmailVerificationRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authRegistrationResendEmailCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resendEmailVerificationRequest** | [**ResendEmailVerificationRequest**](ResendEmailVerificationRequest.md)|  | [optional] 

### Return type

[**RestAuthDetail**](RestAuthDetail.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegistrationVerifyEmailCreate**
> RestAuthDetail authRegistrationVerifyEmailCreate(verifyEmailRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final verifyEmailRequest = VerifyEmailRequest(); // VerifyEmailRequest | 

try {
    final result = api_instance.authRegistrationVerifyEmailCreate(verifyEmailRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authRegistrationVerifyEmailCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyEmailRequest** | [**VerifyEmailRequest**](VerifyEmailRequest.md)|  | 

### Return type

[**RestAuthDetail**](RestAuthDetail.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authUserPartialUpdate**
> UserDetails authUserPartialUpdate(patchedUserDetailsRequest)



Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final patchedUserDetailsRequest = PatchedUserDetailsRequest(); // PatchedUserDetailsRequest | 

try {
    final result = api_instance.authUserPartialUpdate(patchedUserDetailsRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authUserPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patchedUserDetailsRequest** | [**PatchedUserDetailsRequest**](PatchedUserDetailsRequest.md)|  | [optional] 

### Return type

[**UserDetails**](UserDetails.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authUserRetrieve**
> UserDetails authUserRetrieve()



Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();

try {
    final result = api_instance.authUserRetrieve();
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authUserRetrieve: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserDetails**](UserDetails.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authUserUpdate**
> UserDetails authUserUpdate(userDetailsRequest)



Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: tokenAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('tokenAuth').apiKeyPrefix = 'Bearer';

final api_instance = AuthApi();
final userDetailsRequest = UserDetailsRequest(); // UserDetailsRequest | 

try {
    final result = api_instance.authUserUpdate(userDetailsRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authUserUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userDetailsRequest** | [**UserDetailsRequest**](UserDetailsRequest.md)|  | 

### Return type

[**UserDetails**](UserDetails.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

