# ActivitiesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1ActivitiesId**](ActivitiesApi.md#deleteApiV1ActivitiesId) | **DELETE** /api/v1/activities/{id} | Delete a Activity
[**getApiV1Activities**](ActivitiesApi.md#getApiV1Activities) | **GET** /api/v1/activities | List activities
[**getApiV1ActivitiesId**](ActivitiesApi.md#getApiV1ActivitiesId) | **GET** /api/v1/activities/{id} | View activity details
[**postApiV1Activities**](ActivitiesApi.md#postApiV1Activities) | **POST** /api/v1/activities | Create a activity
[**putApiV1ActivitiesId**](ActivitiesApi.md#putApiV1ActivitiesId) | **PUT** /api/v1/activities/{id} | Update Activity


## **deleteApiV1ActivitiesId**

Delete a Activity

Marks an activity as being deleted.

### Example
```bash
dukeds-cli deleteApiV1ActivitiesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Activity UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1Activities**

List activities

Lists all activities

### Example
```bash
dukeds-cli getApiV1Activities
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

## **getApiV1ActivitiesId**

View activity details

Returns the activity details for a given UUID.

### Example
```bash
dukeds-cli getApiV1ActivitiesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Activity UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1Activities**

Create a activity

Creates an activity for the given payload.

### Example
```bash
dukeds-cli postApiV1Activities
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The Name of the activity |
 **description** | **string** | The Description of the activity | [optional]
 **startedOn** | **string** | DateTime when the activity started | [optional]
 **endedOn** | **string** | DateTime when the activity ended | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1ActivitiesId**

Update Activity

Updates the activity details for a given UUID.

### Example
```bash
dukeds-cli putApiV1ActivitiesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Activity UUID |
 **name** | **string** | The Name of the activity | [optional]
 **description** | **string** | The Description of the activity | [optional]
 **startedOn** | **string** | DateTime when the activity started | [optional]
 **endedOn** | **string** | DateTime when the activity ended | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

