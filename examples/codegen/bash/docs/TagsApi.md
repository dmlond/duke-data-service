# TagsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1TagsId**](TagsApi.md#deleteApiV1TagsId) | **DELETE** /api/v1/tags/{id} | Delete a tag
[**getApiV1TagsId**](TagsApi.md#getApiV1TagsId) | **GET** /api/v1/tags/{id} | View tag
[**getApiV1TagsLabels**](TagsApi.md#getApiV1TagsLabels) | **GET** /api/v1/tags/labels | List tag labels
[**getApiV1TagsObjectKindObjectId**](TagsApi.md#getApiV1TagsObjectKindObjectId) | **GET** /api/v1/tags/{object_kind}/{object_id} | List tag objects
[**postApiV1TagsObjectKindObjectId**](TagsApi.md#postApiV1TagsObjectKindObjectId) | **POST** /api/v1/tags/{object_kind}/{object_id} | Create object tag
[**postApiV1TagsObjectKindObjectIdAppend**](TagsApi.md#postApiV1TagsObjectKindObjectIdAppend) | **POST** /api/v1/tags/{object_kind}/{object_id}/append | Append a list of object tags


## **deleteApiV1TagsId**

Delete a tag

Deletes the tag

### Example
```bash
dukeds-cli deleteApiV1TagsId id=value
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

## **getApiV1TagsId**

View tag

view tag

### Example
```bash
dukeds-cli getApiV1TagsId id=value
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

## **getApiV1TagsLabels**

List tag labels

Get a list of the distinct tag label values visible to the current user.

### Example
```bash
dukeds-cli getApiV1TagsLabels  object_kind=value  label_contains=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **objectKind** | **string** | Restricts search scope to tags for this kind of object | [optional]
 **labelContains** | **string** | Searches for tags that contain this text fragment | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1TagsObjectKindObjectId**

List tag objects

Lists tag objects for which the current user has the \"view_project\" permission.

### Example
```bash
dukeds-cli getApiV1TagsObjectKindObjectId object_kind=value object_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1TagsObjectKindObjectId**

Create object tag

Creates an object tag.

### Example
```bash
dukeds-cli postApiV1TagsObjectKindObjectId object_kind=value object_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **label** | **string** |  |
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1TagsObjectKindObjectIdAppend**

Append a list of object tags

Append a list of tags to an object.

### Example
```bash
dukeds-cli postApiV1TagsObjectKindObjectIdAppend object_kind=value object_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tags[label]** | [**array[string]**](string.md) | The textual tag content |
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

