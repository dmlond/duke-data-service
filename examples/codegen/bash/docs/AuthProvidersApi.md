# AuthProvidersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1AuthProviders**](AuthProvidersApi.md#getApiV1AuthProviders) | **GET** /api/v1/auth_providers | List Authentication Providers
[**getApiV1AuthProvidersId**](AuthProvidersApi.md#getApiV1AuthProvidersId) | **GET** /api/v1/auth_providers/{id} | Show Authentication Provider Details
[**getApiV1AuthProvidersIdAffiliates**](AuthProvidersApi.md#getApiV1AuthProvidersIdAffiliates) | **GET** /api/v1/auth_providers/{id}/affiliates | List Auth Provider Affiliates
[**getApiV1AuthProvidersIdAffiliatesUid**](AuthProvidersApi.md#getApiV1AuthProvidersIdAffiliatesUid) | **GET** /api/v1/auth_providers/{id}/affiliates/{uid} | View Auth Provider Affiliate
[**postApiV1AuthProvidersIdAffiliatesUidDdsUser**](AuthProvidersApi.md#postApiV1AuthProvidersIdAffiliatesUidDdsUser) | **POST** /api/v1/auth_providers/{id}/affiliates/{uid}/dds_user | Create User Account for Affiliate


## **getApiV1AuthProviders**

List Authentication Providers

Lists Authentication Providers

### Example
```bash
dukeds-cli getApiV1AuthProviders  page=value  per_page=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
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

## **getApiV1AuthProvidersId**

Show Authentication Provider Details

Show Authentication Provider Details

### Example
```bash
dukeds-cli getApiV1AuthProvidersId id=value
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

## **getApiV1AuthProvidersIdAffiliates**

List Auth Provider Affiliates

List Auth Provider Affiliates

### Example
```bash
dukeds-cli getApiV1AuthProvidersIdAffiliates id=value  full_name_contains=value  page=value  per_page=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | AuthenticationProvider UUID |
 **fullNameContains** | **string** | string contained in name(must be at least 3 characters) |
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

## **getApiV1AuthProvidersIdAffiliatesUid**

View Auth Provider Affiliate

View Auth Provider Affiliate

### Example
```bash
dukeds-cli getApiV1AuthProvidersIdAffiliatesUid id=value uid=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | AuthenticationProvider UUID |
 **uid** | **string** | uid of the Affiliate from the AuthenticationProvider |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1AuthProvidersIdAffiliatesUidDdsUser**

Create User Account for Affiliate

Create User Account for Affiliate

### Example
```bash
dukeds-cli postApiV1AuthProvidersIdAffiliatesUidDdsUser id=value uid=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | AuthenticationProvider UUID |
 **uid** | **string** | uid of the Affiliate from the AuthenticationProvider |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

