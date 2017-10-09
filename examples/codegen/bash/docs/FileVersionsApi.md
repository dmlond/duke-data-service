# FileVersionsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1FileVersionsId**](FileVersionsApi.md#deleteApiV1FileVersionsId) | **DELETE** /api/v1/file_versions/{id} | Delete a file version metadata object
[**getApiV1FileVersionsId**](FileVersionsApi.md#getApiV1FileVersionsId) | **GET** /api/v1/file_versions/{id} | View file version
[**getApiV1FileVersionsIdUrl**](FileVersionsApi.md#getApiV1FileVersionsIdUrl) | **GET** /api/v1/file_versions/{id}/url | Download a file_version
[**postApiV1FileVersionsIdCurrent**](FileVersionsApi.md#postApiV1FileVersionsIdCurrent) | **POST** /api/v1/file_versions/{id}/current | Promote file version
[**putApiV1FileVersionsId**](FileVersionsApi.md#putApiV1FileVersionsId) | **PUT** /api/v1/file_versions/{id} | Update file version


## **deleteApiV1FileVersionsId**

Delete a file version metadata object

Deletes the file version from view

### Example
```bash
dukeds-cli deleteApiV1FileVersionsId id=value
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

## **getApiV1FileVersionsId**

View file version

view file version

### Example
```bash
dukeds-cli getApiV1FileVersionsId id=value
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

## **getApiV1FileVersionsIdUrl**

Download a file_version

Generates and returns a storage provider specific pre-signed URL that client can use to download the file version.

### Example
```bash
dukeds-cli getApiV1FileVersionsIdUrl id=value
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

## **postApiV1FileVersionsIdCurrent**

Promote file version

promote file version

### Example
```bash
dukeds-cli postApiV1FileVersionsIdCurrent id=value
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

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1FileVersionsId**

Update file version

update file version

### Example
```bash
dukeds-cli putApiV1FileVersionsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** |  |
 **label** | **string** |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

