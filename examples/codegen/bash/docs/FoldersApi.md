# FoldersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1FoldersId**](FoldersApi.md#deleteApiV1FoldersId) | **DELETE** /api/v1/folders/{id} | Delete a folder
[**getApiV1FoldersId**](FoldersApi.md#getApiV1FoldersId) | **GET** /api/v1/folders/{id} | View folder details
[**getApiV1FoldersIdChildren**](FoldersApi.md#getApiV1FoldersIdChildren) | **GET** /api/v1/folders/{id}/children | List folder children
[**postApiV1Folders**](FoldersApi.md#postApiV1Folders) | **POST** /api/v1/folders | Create a project folder
[**putApiV1FoldersIdMove**](FoldersApi.md#putApiV1FoldersIdMove) | **PUT** /api/v1/folders/{id}/move | Move folder
[**putApiV1FoldersIdRename**](FoldersApi.md#putApiV1FoldersIdRename) | **PUT** /api/v1/folders/{id}/rename | Rename folder


## **deleteApiV1FoldersId**

Delete a folder

Remove the folder for a given uuid.

### Example
```bash
dukeds-cli deleteApiV1FoldersId id=value
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

## **getApiV1FoldersId**

View folder details

Returns the folder details for a given uuid of a folder.

### Example
```bash
dukeds-cli getApiV1FoldersId id=value
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

## **getApiV1FoldersIdChildren**

List folder children

Returns the immediate children of the folder.

### Example
```bash
dukeds-cli getApiV1FoldersIdChildren id=value  name_contains=value  page=value  per_page=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** |  |
 **nameContains** | **string** | list children whose name contains this string | [optional]
 **excludeResponseFields** | [**array[string]**](string.md) | Space delimited list of fields to exclude from the serialized response. | [optional]
 **page** | **integer** | Requested Page (default first page) | [optional]
 **perPage** | **integer** | Number of Objects per page (default 25) | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1Folders**

Create a project folder

Creates a project folder for the given payload.

### Example
```bash
dukeds-cli postApiV1Folders
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parent[kind]** | **string** | Parent kind |
 **parent[id]** | **string** | Parent ID |
 **name** | **string** | Folder Name |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1FoldersIdMove**

Move folder

Move a folder with a given uuid to a new parent.

### Example
```bash
dukeds-cli putApiV1FoldersIdMove id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parent[kind]** | **string** | Parent kind |
 **parent[id]** | **string** | Parent ID |
 **id** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1FoldersIdRename**

Rename folder

Give a folder with a given uuid a new name.

### Example
```bash
dukeds-cli putApiV1FoldersIdRename id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** |  |
 **id** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

