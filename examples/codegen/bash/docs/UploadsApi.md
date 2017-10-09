# UploadsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1UploadsId**](UploadsApi.md#getApiV1UploadsId) | **GET** /api/v1/uploads/{id} | View upload details/status
[**putApiV1UploadsIdChunks**](UploadsApi.md#putApiV1UploadsIdChunks) | **PUT** /api/v1/uploads/{id}/chunks | Get pre-signed URL to upload the next chunk
[**putApiV1UploadsIdComplete**](UploadsApi.md#putApiV1UploadsIdComplete) | **PUT** /api/v1/uploads/{id}/complete | Complete the chunked file upload
[**putApiV1UploadsIdHashes**](UploadsApi.md#putApiV1UploadsIdHashes) | **PUT** /api/v1/uploads/{id}/hashes | Report upload hash


## **getApiV1UploadsId**

View upload details/status

View upload details/status

### Example
```bash
dukeds-cli getApiV1UploadsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Globally unique id of the upload object. |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1UploadsIdChunks**

Get pre-signed URL to upload the next chunk

Get pre-signed URL to upload the next chunk. This will also ensure that the project container exists in the storage_provider.

### Example
```bash
dukeds-cli putApiV1UploadsIdChunks id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The Upload Id |
 **number** | **integer** | The chunk number. |
 **size** | **integer** | The size of the chunk in bytes that the client will upload using the pre-signed URL. |
 **hash[value]** | **string** | The chunk hash computed by the client. |
 **hash[algorithm]** | **string** | The hash algorithm used (i.e. md5, sha256, sha1, etc.) - this must be the default algorithm supported by storage provider. |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1UploadsIdComplete**

Complete the chunked file upload

Complete the chunked file upload

### Example
```bash
dukeds-cli putApiV1UploadsIdComplete id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hash[value]** | **string** | The entire file hash (computed by client). |
 **hash[algorithm]** | **string** | The algorithm used by client to compute entire file hash (i.e. md5, sha256, sha1, etc.). |
 **id** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1UploadsIdHashes**

Report upload hash

Report hash (fingerprint) for the uploaded (or to be uploaded) file.

### Example
```bash
dukeds-cli putApiV1UploadsIdHashes id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **value** | **string** | The entire file hash (computed by client). |
 **algorithm** | **string** | The algorithm used by client to compute entire file hash (i.e. md5, sha256, sha1, etc.). |
 **id** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

