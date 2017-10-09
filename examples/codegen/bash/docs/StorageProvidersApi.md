# StorageProvidersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1StorageProviders**](StorageProvidersApi.md#getApiV1StorageProviders) | **GET** /api/v1/storage_providers | List storage providers
[**getApiV1StorageProvidersId**](StorageProvidersApi.md#getApiV1StorageProvidersId) | **GET** /api/v1/storage_providers/{id} | View storage provider


## **getApiV1StorageProviders**

List storage providers

Returns a list of all storage providers

### Example
```bash
dukeds-cli getApiV1StorageProviders
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

## **getApiV1StorageProvidersId**

View storage provider

Returns the storage providers for a given user

### Example
```bash
dukeds-cli getApiV1StorageProvidersId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | StorageProvider UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

