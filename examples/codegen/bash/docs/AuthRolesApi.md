# AuthRolesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1AuthRoles**](AuthRolesApi.md#getApiV1AuthRoles) | **GET** /api/v1/auth_roles | List authorization roles for a context
[**getApiV1AuthRolesId**](AuthRolesApi.md#getApiV1AuthRolesId) | **GET** /api/v1/auth_roles/{id} | View authorization role details


## **getApiV1AuthRoles**

List authorization roles for a context

Lists authorization roles for a given context.

### Example
```bash
dukeds-cli getApiV1AuthRoles  context=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **context** | **string** | Role Context, must be one of system, project | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1AuthRolesId**

View authorization role details

View authorization role details.

### Example
```bash
dukeds-cli getApiV1AuthRolesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

