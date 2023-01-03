# openapi.api.UtilsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**utilsCsrfmiddlewaretokenCreate**](UtilsApi.md#utilscsrfmiddlewaretokencreate) | **POST** /api/utils/csrfmiddlewaretoken/ | 
[**utilsCsrfmiddlewaretokenRetrieve**](UtilsApi.md#utilscsrfmiddlewaretokenretrieve) | **GET** /api/utils/csrfmiddlewaretoken/ | 


# **utilsCsrfmiddlewaretokenCreate**
> Csrfmiddlewaretoken utilsCsrfmiddlewaretokenCreate(csrfmiddlewaretoken)



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

final api_instance = UtilsApi();
final csrfmiddlewaretoken = Csrfmiddlewaretoken(); // Csrfmiddlewaretoken | 

try {
    final result = api_instance.utilsCsrfmiddlewaretokenCreate(csrfmiddlewaretoken);
    print(result);
} catch (e) {
    print('Exception when calling UtilsApi->utilsCsrfmiddlewaretokenCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **csrfmiddlewaretoken** | [**Csrfmiddlewaretoken**](Csrfmiddlewaretoken.md)|  | 

### Return type

[**Csrfmiddlewaretoken**](Csrfmiddlewaretoken.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **utilsCsrfmiddlewaretokenRetrieve**
> Csrfmiddlewaretoken utilsCsrfmiddlewaretokenRetrieve()



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

final api_instance = UtilsApi();

try {
    final result = api_instance.utilsCsrfmiddlewaretokenRetrieve();
    print(result);
} catch (e) {
    print('Exception when calling UtilsApi->utilsCsrfmiddlewaretokenRetrieve: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Csrfmiddlewaretoken**](Csrfmiddlewaretoken.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [tokenAuth](../README.md#tokenAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

