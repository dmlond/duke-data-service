# UserApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1UserApiToken**](UserApi.md#getApiV1UserApiToken) | **GET** /api/v1/user/api_token | api_token


## **getApiV1UserApiToken**

api_token

This allows a client to present an access token from a registered authentication service and get an api token

### Example
```bash
dukeds-cli getApiV1UserApiToken  access_token=value  authentication_service_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accessToken** | **string** |  |
 **authenticationServiceId** | **string** | authentication service uuid | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

