# SoftwareAgentsApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteApiV1SoftwareAgentsId**](SoftwareAgentsApi.md#deleteApiV1SoftwareAgentsId) | **DELETE** /api/v1/software_agents/{id} | Delete a Software Agent
[**deleteApiV1SoftwareAgentsIdApiKey**](SoftwareAgentsApi.md#deleteApiV1SoftwareAgentsIdApiKey) | **DELETE** /api/v1/software_agents/{id}/api_key | Delete software agent API key
[**getApiV1SoftwareAgents**](SoftwareAgentsApi.md#getApiV1SoftwareAgents) | **GET** /api/v1/software_agents | List software agents
[**getApiV1SoftwareAgentsId**](SoftwareAgentsApi.md#getApiV1SoftwareAgentsId) | **GET** /api/v1/software_agents/{id} | View software agent details
[**getApiV1SoftwareAgentsIdApiKey**](SoftwareAgentsApi.md#getApiV1SoftwareAgentsIdApiKey) | **GET** /api/v1/software_agents/{id}/api_key | View software agent API key
[**postApiV1SoftwareAgents**](SoftwareAgentsApi.md#postApiV1SoftwareAgents) | **POST** /api/v1/software_agents | Create a software agent
[**postApiV1SoftwareAgentsApiToken**](SoftwareAgentsApi.md#postApiV1SoftwareAgentsApiToken) | **POST** /api/v1/software_agents/api_token | Get software agent access token
[**putApiV1SoftwareAgentsId**](SoftwareAgentsApi.md#putApiV1SoftwareAgentsId) | **PUT** /api/v1/software_agents/{id} | Update Software Agent
[**putApiV1SoftwareAgentsIdApiKey**](SoftwareAgentsApi.md#putApiV1SoftwareAgentsIdApiKey) | **PUT** /api/v1/software_agents/{id}/api_key | Re-generate software agent API key


## **deleteApiV1SoftwareAgentsId**

Delete a Software Agent

Marks a software agent as being deleted.

### Example
```bash
dukeds-cli deleteApiV1SoftwareAgentsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Software Agent UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **deleteApiV1SoftwareAgentsIdApiKey**

Delete software agent API key

delete software_agent api_key

### Example
```bash
dukeds-cli deleteApiV1SoftwareAgentsIdApiKey id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Software agent UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1SoftwareAgents**

List software agents

Lists all software agents (software_agent gets empty list)

### Example
```bash
dukeds-cli getApiV1SoftwareAgents
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

## **getApiV1SoftwareAgentsId**

View software agent details

Returns the software agent details for a given UUID.

### Example
```bash
dukeds-cli getApiV1SoftwareAgentsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Software agent UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **getApiV1SoftwareAgentsIdApiKey**

View software agent API key

View software_agent api_key

### Example
```bash
dukeds-cli getApiV1SoftwareAgentsIdApiKey id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Software agent UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not Applicable
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1SoftwareAgents**

Create a software agent

Creates a software agent for the given payload.

### Example
```bash
dukeds-cli postApiV1SoftwareAgents
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The Name of the software agent |
 **description** | **string** | The Description of the software agent | [optional]
 **repoUrl** | **string** | The url of the repository (e.g. Git, Bitbucket, etc.) that contains the agent source code. | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1SoftwareAgentsApiToken**

Get software agent access token

Get software agent access token

### Example
```bash
dukeds-cli postApiV1SoftwareAgentsApiToken
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentKey** | **string** | Software agent secret key |
 **userKey** | **string** | User secret key |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1SoftwareAgentsId**

Update Software Agent

Updates the software agent details for a given UUID.

### Example
```bash
dukeds-cli putApiV1SoftwareAgentsId id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Software Agent UUID |
 **name** | **string** | The Name of the Software Agent | [optional]
 **description** | **string** | The Description of the Software Agent | [optional]
 **repoUrl** | **string** | The Repo url of the Software Agent | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **putApiV1SoftwareAgentsIdApiKey**

Re-generate software agent API key

regenerates software_agent api_key

### Example
```bash
dukeds-cli putApiV1SoftwareAgentsIdApiKey id=value
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Software agent UUID |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

