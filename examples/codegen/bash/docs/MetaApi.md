# MetaApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1MetaObjectKindObjectIdTemplateId**](MetaApi.md#deleteApiV1MetaObjectKindObjectIdTemplateId) | **DELETE** /api/v1/meta/{object_kind}/{object_id}/{template_id} | Delete objet metadata
[**getApiV1MetaObjectKindObjectId**](MetaApi.md#getApiV1MetaObjectKindObjectId) | **GET** /api/v1/meta/{object_kind}/{object_id} | View all object metadata
[**getApiV1MetaObjectKindObjectIdTemplateId**](MetaApi.md#getApiV1MetaObjectKindObjectIdTemplateId) | **GET** /api/v1/meta/{object_kind}/{object_id}/{template_id} | View object metadata
[**postApiV1MetaObjectKindObjectIdTemplateId**](MetaApi.md#postApiV1MetaObjectKindObjectIdTemplateId) | **POST** /api/v1/meta/{object_kind}/{object_id}/{template_id} | Create object metadata
[**putApiV1MetaObjectKindObjectIdTemplateId**](MetaApi.md#putApiV1MetaObjectKindObjectIdTemplateId) | **PUT** /api/v1/meta/{object_kind}/{object_id}/{template_id} | Update object metadata


## **deleteApiV1MetaObjectKindObjectIdTemplateId**

Delete objet metadata

Deletes objet metadata

### Example
```bash
dukeds-cli deleteApiV1MetaObjectKindObjectIdTemplateId object_kind=value object_id=value template_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |
 **templateId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1MetaObjectKindObjectId**

View all object metadata

Used to retrieve all metadata associated with a DDS object, optionally find a template instance by name.

### Example
```bash
dukeds-cli getApiV1MetaObjectKindObjectId object_kind=value object_id=value  meta_template_name=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |
 **metaTemplateName** | **string** | The unique meta_template_name of the template; performs an exact match. | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1MetaObjectKindObjectIdTemplateId**

View object metadata

Used to retrieve the metadata template instance for a corresponding DDS object.

### Example
```bash
dukeds-cli getApiV1MetaObjectKindObjectIdTemplateId object_kind=value object_id=value template_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |
 **templateId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1MetaObjectKindObjectIdTemplateId**

Create object metadata

Creates object metadata.

### Example
```bash
dukeds-cli postApiV1MetaObjectKindObjectIdTemplateId object_kind=value object_id=value template_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **properties[key]** | [**array[string]**](string.md) | The property key to set |
 **properties[value]** | [**array[string]**](string.md) | The key value |
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |
 **templateId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1MetaObjectKindObjectIdTemplateId**

Update object metadata

Updates object metadata

### Example
```bash
dukeds-cli putApiV1MetaObjectKindObjectIdTemplateId object_kind=value object_id=value template_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **properties[key]** | [**array[string]**](string.md) | The property key to set |
 **properties[value]** | [**array[string]**](string.md) | The key value |
 **objectKind** | **integer** |  |
 **objectId** | **integer** |  |
 **templateId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

