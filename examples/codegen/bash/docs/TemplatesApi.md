# TemplatesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1TemplatesId**](TemplatesApi.md#deleteApiV1TemplatesId) | **DELETE** /api/v1/templates/{id} | Delete a template
[**getApiV1Templates**](TemplatesApi.md#getApiV1Templates) | **GET** /api/v1/templates | List templates
[**getApiV1TemplatesId**](TemplatesApi.md#getApiV1TemplatesId) | **GET** /api/v1/templates/{id} | View template details
[**getApiV1TemplatesTemplateIdProperties**](TemplatesApi.md#getApiV1TemplatesTemplateIdProperties) | **GET** /api/v1/templates/{template_id}/properties | List properties
[**postApiV1Templates**](TemplatesApi.md#postApiV1Templates) | **POST** /api/v1/templates | Create template
[**postApiV1TemplatesTemplateIdProperties**](TemplatesApi.md#postApiV1TemplatesTemplateIdProperties) | **POST** /api/v1/templates/{template_id}/properties | Create property
[**putApiV1TemplatesId**](TemplatesApi.md#putApiV1TemplatesId) | **PUT** /api/v1/templates/{id} | Update template


## **deleteApiV1TemplatesId**

Delete a template

Deletes a template.

### Example
```bash
dukeds-cli deleteApiV1TemplatesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Template UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1Templates**

List templates

List templates.

### Example
```bash
dukeds-cli getApiV1Templates  name_contains=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nameContains** | **string** | list templates whose name contains the specified string | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1TemplatesId**

View template details

Returns the template details for a given UUID.

### Example
```bash
dukeds-cli getApiV1TemplatesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Template UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1TemplatesTemplateIdProperties**

List properties

List properties.

### Example
```bash
dukeds-cli getApiV1TemplatesTemplateIdProperties template_id=value  key=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateId** | **integer** |  |
 **key** | **string** | The unique key of the template property | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1Templates**

Create template

Creates a template.

### Example
```bash
dukeds-cli postApiV1Templates
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The unique name of the template |
 **label** | **string** | A short display label for the template |
 **description** | **string** | A verbose description of the template | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1TemplatesTemplateIdProperties**

Create property

Creates a property.

### Example
```bash
dukeds-cli postApiV1TemplatesTemplateIdProperties template_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **string** | The unique key of the property |
 **label** | **string** | A short display label for the property |
 **description** | **string** | A verbose description of the property |
 **type** | **string** | The datatype of the key’s value; currenty only the Elasticsearch core datatypes are supported |
 **templateId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1TemplatesId**

Update template

Updates template UUID.

### Example
```bash
dukeds-cli putApiV1TemplatesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Template UUID |
 **name** | **string** | The Name of the template | [optional]
 **label** | **string** | The Label of the template | [optional]
 **description** | **string** | The Description of the template | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

