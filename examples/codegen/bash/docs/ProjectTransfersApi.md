# ProjectTransfersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1ProjectTransfers**](ProjectTransfersApi.md#getApiV1ProjectTransfers) | **GET** /api/v1/project_transfers | View all project transfers
[**getApiV1ProjectTransfersId**](ProjectTransfersApi.md#getApiV1ProjectTransfersId) | **GET** /api/v1/project_transfers/{id} | View a project transfer
[**putApiV1ProjectTransfersIdAccept**](ProjectTransfersApi.md#putApiV1ProjectTransfersIdAccept) | **PUT** /api/v1/project_transfers/{id}/accept | Accept a project transfer
[**putApiV1ProjectTransfersIdCancel**](ProjectTransfersApi.md#putApiV1ProjectTransfersIdCancel) | **PUT** /api/v1/project_transfers/{id}/cancel | Cancel a project transfer
[**putApiV1ProjectTransfersIdReject**](ProjectTransfersApi.md#putApiV1ProjectTransfersIdReject) | **PUT** /api/v1/project_transfers/{id}/reject | Reject a project transfer


## **getApiV1ProjectTransfers**

View all project transfers

View all project transfers.

### Example
```bash
dukeds-cli getApiV1ProjectTransfers  status=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **string** | Status must be one of the allowed statuses | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectTransfersId**

View a project transfer

Used to view an instance of a project transfer.

### Example
```bash
dukeds-cli getApiV1ProjectTransfersId id=value
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

## **putApiV1ProjectTransfersIdAccept**

Accept a project transfer

Accept a pending project transfer.

### Example
```bash
dukeds-cli putApiV1ProjectTransfersIdAccept id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The unique id of the project transfer. |
 **statusComment** | **string** | An optional comment that can be provided. | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1ProjectTransfersIdCancel**

Cancel a project transfer

Cancel a pending project transfer.

### Example
```bash
dukeds-cli putApiV1ProjectTransfersIdCancel id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The unique id of the project transfer. |
 **statusComment** | **string** | An optional comment that can be provided. | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1ProjectTransfersIdReject**

Reject a project transfer

Reject a pending project transfer.

### Example
```bash
dukeds-cli putApiV1ProjectTransfersIdReject id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The unique id of the project transfer. |
 **statusComment** | **string** | An optional comment that can be provided. | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

