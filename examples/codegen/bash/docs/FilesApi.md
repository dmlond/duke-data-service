# FilesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1FilesId**](FilesApi.md#deleteApiV1FilesId) | **DELETE** /api/v1/files/{id} | Delete a file metadata object
[**getApiV1FilesId**](FilesApi.md#getApiV1FilesId) | **GET** /api/v1/files/{id} | View file metadata object details
[**getApiV1FilesIdUrl**](FilesApi.md#getApiV1FilesIdUrl) | **GET** /api/v1/files/{id}/url | Download a file
[**getApiV1FilesIdVersions**](FilesApi.md#getApiV1FilesIdVersions) | **GET** /api/v1/files/{id}/versions | List file versions
[**postApiV1Files**](FilesApi.md#postApiV1Files) | **POST** /api/v1/files | Create a file
[**putApiV1FilesId**](FilesApi.md#putApiV1FilesId) | **PUT** /api/v1/files/{id} | Update file properties
[**putApiV1FilesIdMove**](FilesApi.md#putApiV1FilesIdMove) | **PUT** /api/v1/files/{id}/move | Move file
[**putApiV1FilesIdRename**](FilesApi.md#putApiV1FilesIdRename) | **PUT** /api/v1/files/{id}/rename | Rename file


## **deleteApiV1FilesId**

Delete a file metadata object

Deletes the file from view

### Example
```bash
dukeds-cli deleteApiV1FilesId id=value
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

## **getApiV1FilesId**

View file metadata object details

Access metadata details about a file.

### Example
```bash
dukeds-cli getApiV1FilesId id=value
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

## **getApiV1FilesIdUrl**

Download a file

Generates and returns a storage provider specific pre-signed URL that client can use to download file.

### Example
```bash
dukeds-cli getApiV1FilesIdUrl id=value
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

## **getApiV1FilesIdVersions**

List file versions

If there are previous versions of a file, this action can be used to retrieve information about the older versions.

### Example
```bash
dukeds-cli getApiV1FilesIdVersions id=value
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

## **postApiV1Files**

Create a file

Creates a project file for the given payload.

### Example
```bash
dukeds-cli postApiV1Files
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parent[kind]** | **string** | Parent kind |
 **parent[id]** | **string** | Parent UUID |
 **upload[id]** | **string** | Upload UUID |
 **label** | **string** |  | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1FilesId**

Update file properties

Updates one or more file resource properties; if this action modifies the upload property, the previous file resource is transitioned to version history (see File Versions)

### Example
```bash
dukeds-cli putApiV1FilesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upload[id]** | **string** | Upload UUID |
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

## **putApiV1FilesIdMove**

Move file

Move a file metadata object to a new parent

### Example
```bash
dukeds-cli putApiV1FilesIdMove id=value
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

## **putApiV1FilesIdRename**

Rename file

Rename a file metadata object

### Example
```bash
dukeds-cli putApiV1FilesIdRename id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | New name for File |
 **id** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

