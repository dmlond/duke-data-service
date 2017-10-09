# UsersApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**getApiV1Users**](UsersApi.md#getApiV1Users) | **GET** /api/v1/users | users
[**getApiV1UsersId**](UsersApi.md#getApiV1UsersId) | **GET** /api/v1/users/{id} | View user details


## **getApiV1Users**

users

This allows a client to get a list of users, with an optional filter

### Example
```bash
dukeds-cli getApiV1Users  last_name_begins_with=value  first_name_begins_with=value  full_name_contains=value  page=value  per_page=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lastNameBeginsWith** | **string** | list users whose last name begins with this string | [optional]
 **firstNameBeginsWith** | **string** | list users whose first name begins with this string | [optional]
 **fullNameContains** | **string** | list users whose full name contains this string | [optional]
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

## **getApiV1UsersId**

View user details

Returns the user details for a given uuid of a user.

### Example
```bash
dukeds-cli getApiV1UsersId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | User UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

