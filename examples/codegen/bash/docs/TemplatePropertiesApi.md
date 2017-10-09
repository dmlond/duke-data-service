# TemplatePropertiesApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1TemplatePropertiesId**](TemplatePropertiesApi.md#deleteApiV1TemplatePropertiesId) | **DELETE** /api/v1/template_properties/{id} | Delete a template property
[**getApiV1TemplatePropertiesId**](TemplatePropertiesApi.md#getApiV1TemplatePropertiesId) | **GET** /api/v1/template_properties/{id} | View property details
[**putApiV1TemplatePropertiesId**](TemplatePropertiesApi.md#putApiV1TemplatePropertiesId) | **PUT** /api/v1/template_properties/{id} | Update template property


## **deleteApiV1TemplatePropertiesId**

Delete a template property

Deletes a template property.

### Example
```bash
dukeds-cli deleteApiV1TemplatePropertiesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Template property UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1TemplatePropertiesId**

View property details

Returns the property details for a given UUID.

### Example
```bash
dukeds-cli getApiV1TemplatePropertiesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Property UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1TemplatePropertiesId**

Update template property

Updates template property for given UUID.

### Example
```bash
dukeds-cli putApiV1TemplatePropertiesId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** |  |
 **key** | **string** | The unique key of the template property | [optional]
 **label** | **string** | A short display label for the template property | [optional]
 **description** | **string** | A verbose description of the template property | [optional]
 **type** | **string** | The datatype of the key’s value; currenty only the Elasticsearch core datatypes are supported | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

