# SystemApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1SystemPermissionsUserId**](SystemApi.md#deleteApiV1SystemPermissionsUserId) | **DELETE** /api/v1/system/permissions/{user_id} | Revoke system permissions to user
[**getApiV1SystemPermissions**](SystemApi.md#getApiV1SystemPermissions) | **GET** /api/v1/system/permissions | List system permissions
[**getApiV1SystemPermissionsUserId**](SystemApi.md#getApiV1SystemPermissionsUserId) | **GET** /api/v1/system/permissions/{user_id} | View system level permissions for user
[**putApiV1SystemPermissionsUserId**](SystemApi.md#putApiV1SystemPermissionsUserId) | **PUT** /api/v1/system/permissions/{user_id} | Grant system level permission to user


## **deleteApiV1SystemPermissionsUserId**

Revoke system permissions to user

Deletes system permissions for a given user

### Example
```bash
dukeds-cli deleteApiV1SystemPermissionsUserId user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1SystemPermissions**

List system permissions

Returns a list of users with their associated auth_roles

### Example
```bash
dukeds-cli getApiV1SystemPermissions
```

### Parameters
This endpoint does not need any parameter.

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1SystemPermissionsUserId**

View system level permissions for user

Returns the system permissions for a given user

### Example
```bash
dukeds-cli getApiV1SystemPermissionsUserId user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1SystemPermissionsUserId**

Grant system level permission to user

Creates or updates system permission for a given user

### Example
```bash
dukeds-cli putApiV1SystemPermissionsUserId user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authRole[id]** | **string** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

