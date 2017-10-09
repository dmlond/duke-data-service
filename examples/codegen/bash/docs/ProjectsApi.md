# ProjectsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1ProjectsId**](ProjectsApi.md#deleteApiV1ProjectsId) | **DELETE** /api/v1/projects/{id} | Delete a project
[**deleteApiV1ProjectsProjectIdAffiliatesUserId**](ProjectsApi.md#deleteApiV1ProjectsProjectIdAffiliatesUserId) | **DELETE** /api/v1/projects/{project_id}/affiliates/{user_id} | Delete project affiliation
[**deleteApiV1ProjectsProjectIdPermissionsUserId**](ProjectsApi.md#deleteApiV1ProjectsProjectIdPermissionsUserId) | **DELETE** /api/v1/projects/{project_id}/permissions/{user_id} | Revoke project level permissions for user
[**getApiV1Projects**](ProjectsApi.md#getApiV1Projects) | **GET** /api/v1/projects | List projects
[**getApiV1ProjectsId**](ProjectsApi.md#getApiV1ProjectsId) | **GET** /api/v1/projects/{id} | View project details
[**getApiV1ProjectsIdChildren**](ProjectsApi.md#getApiV1ProjectsIdChildren) | **GET** /api/v1/projects/{id}/children | List project children
[**getApiV1ProjectsProjectIdAffiliates**](ProjectsApi.md#getApiV1ProjectsProjectIdAffiliates) | **GET** /api/v1/projects/{project_id}/affiliates | List project affiliations
[**getApiV1ProjectsProjectIdAffiliatesUserId**](ProjectsApi.md#getApiV1ProjectsProjectIdAffiliatesUserId) | **GET** /api/v1/projects/{project_id}/affiliates/{user_id} | View project level affiliation for a user
[**getApiV1ProjectsProjectIdPermissions**](ProjectsApi.md#getApiV1ProjectsProjectIdPermissions) | **GET** /api/v1/projects/{project_id}/permissions | List project level permissions
[**getApiV1ProjectsProjectIdPermissionsUserId**](ProjectsApi.md#getApiV1ProjectsProjectIdPermissionsUserId) | **GET** /api/v1/projects/{project_id}/permissions/{user_id} | View project level permissions for a user
[**getApiV1ProjectsProjectIdTransfers**](ProjectsApi.md#getApiV1ProjectsProjectIdTransfers) | **GET** /api/v1/projects/{project_id}/transfers | List project transfers
[**getApiV1ProjectsProjectIdUploads**](ProjectsApi.md#getApiV1ProjectsProjectIdUploads) | **GET** /api/v1/projects/{project_id}/uploads | List file uploads for a project
[**postApiV1Projects**](ProjectsApi.md#postApiV1Projects) | **POST** /api/v1/projects | Create a project
[**postApiV1ProjectsProjectIdTransfers**](ProjectsApi.md#postApiV1ProjectsProjectIdTransfers) | **POST** /api/v1/projects/{project_id}/transfers | Initiate a project transfer
[**postApiV1ProjectsProjectIdUploads**](ProjectsApi.md#postApiV1ProjectsProjectIdUploads) | **POST** /api/v1/projects/{project_id}/uploads | Initiate a chunked file upload for a project
[**putApiV1ProjectsId**](ProjectsApi.md#putApiV1ProjectsId) | **PUT** /api/v1/projects/{id} | Update a project
[**putApiV1ProjectsProjectIdAffiliatesUserId**](ProjectsApi.md#putApiV1ProjectsProjectIdAffiliatesUserId) | **PUT** /api/v1/projects/{project_id}/affiliates/{user_id} | Associate affiliate to a project
[**putApiV1ProjectsProjectIdPermissionsUserId**](ProjectsApi.md#putApiV1ProjectsProjectIdPermissionsUserId) | **PUT** /api/v1/projects/{project_id}/permissions/{user_id} | Grant project level permissions to a user


## **deleteApiV1ProjectsId**

Delete a project

Marks a project as being deleted.

### Example
```bash
dukeds-cli deleteApiV1ProjectsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Project UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **deleteApiV1ProjectsProjectIdAffiliatesUserId**

Delete project affiliation

Remove project level affiliation for a user

### Example
```bash
dukeds-cli deleteApiV1ProjectsProjectIdAffiliatesUserId project_id=value user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **deleteApiV1ProjectsProjectIdPermissionsUserId**

Revoke project level permissions for user

Revoke project permissions

### Example
```bash
dukeds-cli deleteApiV1ProjectsProjectIdPermissionsUserId project_id=value user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1Projects**

List projects

Lists projects for which the current user has the \"view_project\" permission.

### Example
```bash
dukeds-cli getApiV1Projects  page=value  per_page=value
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

## **getApiV1ProjectsId**

View project details

Returns the project details for a given project uuid.

### Example
```bash
dukeds-cli getApiV1ProjectsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Project UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectsIdChildren**

List project children

Returns the immediate children of the project.

### Example
```bash
dukeds-cli getApiV1ProjectsIdChildren id=value  name_contains=value  page=value  per_page=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **integer** |  |
 **nameContains** | **string** | list children whose name contains this string | [optional]
 **excludeResponseFields** | [**array[string]**](string.md) | Space delimited list of fields to exclude from the serialized response. | [optional]
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

## **getApiV1ProjectsProjectIdAffiliates**

List project affiliations

List project affiliations

### Example
```bash
dukeds-cli getApiV1ProjectsProjectIdAffiliates project_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectsProjectIdAffiliatesUserId**

View project level affiliation for a user

View project level affiliation for a user

### Example
```bash
dukeds-cli getApiV1ProjectsProjectIdAffiliatesUserId project_id=value user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectsProjectIdPermissions**

List project level permissions

Lists project permissions.

### Example
```bash
dukeds-cli getApiV1ProjectsProjectIdPermissions project_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectsProjectIdPermissionsUserId**

View project level permissions for a user

View project permissions.

### Example
```bash
dukeds-cli getApiV1ProjectsProjectIdPermissionsUserId project_id=value user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectsProjectIdTransfers**

List project transfers

list project transfers

### Example
```bash
dukeds-cli getApiV1ProjectsProjectIdTransfers project_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1ProjectsProjectIdUploads**

List file uploads for a project

List file uploads for a project

### Example
```bash
dukeds-cli getApiV1ProjectsProjectIdUploads project_id=value  page=value  per_page=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **string** | The ID of the Project |
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

## **postApiV1Projects**

Create a project

Creates a project for the given payload.

### Example
```bash
dukeds-cli postApiV1Projects
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The Name of the Project |
 **description** | **string** | The Description of the Project |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1ProjectsProjectIdTransfers**

Initiate a project transfer

Initiates a project transfer from the current owner to a new owner or list of owners.

### Example
```bash
dukeds-cli postApiV1ProjectsProjectIdTransfers project_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **string** | The ID of the Project |
 **toUsers[id]** | [**array[string]**](string.md) | The unique id of a user |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1ProjectsProjectIdUploads**

Initiate a chunked file upload for a project

This is the first step in uploading a large file. An upload objects is created along with a composite status object used to track the progress of the chunked upload.

### Example
```bash
dukeds-cli postApiV1ProjectsProjectIdUploads project_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **string** | The ID of the Project |
 **name** | **string** | The name of the client file to upload. |
 **contentType** | **string** | Valid Media Type |
 **size** | **integer** | The size in bytes |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1ProjectsId**

Update a project

Update the project details for a given project uuid.

### Example
```bash
dukeds-cli putApiV1ProjectsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Project UUID |
 **name** | **string** | The Name of the Project | [optional]
 **description** | **string** | The Description of the Project | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1ProjectsProjectIdAffiliatesUserId**

Associate affiliate to a project

Deletes any existing project role for the user and assigns new role.

### Example
```bash
dukeds-cli putApiV1ProjectsProjectIdAffiliatesUserId project_id=value user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectRole[id]** | **string** |  |
 **projectId** | **integer** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1ProjectsProjectIdPermissionsUserId**

Grant project level permissions to a user

Revokes (deletes) any existing project level authorization roles for the user and grants new set.

### Example
```bash
dukeds-cli putApiV1ProjectsProjectIdPermissionsUserId project_id=value user_id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authRole[id]** | **string** |  |
 **projectId** | **integer** |  |
 **userId** | **integer** |  |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

