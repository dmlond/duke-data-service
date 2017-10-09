# SearchApi

All URIs are relative to **

Method | HTTP request | Description
------------- | ------------- | -------------
[**postApiV1Search**](SearchApi.md#postApiV1Search) | **POST** /api/v1/search | Search Objects
[**postApiV1SearchProvenance**](SearchApi.md#postApiV1SearchProvenance) | **POST** /api/v1/search/provenance | Search Provenance
[**postApiV1SearchProvenanceOrigin**](SearchApi.md#postApiV1SearchProvenanceOrigin) | **POST** /api/v1/search/provenance/origin | Search Provenance wasGeneratedBy


## **postApiV1Search**

Search Objects

Search for DDS objects using the elasticsearch query_dsl on supported kinds of objects

### Example
```bash
dukeds-cli postApiV1Search
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **includeKinds** | [**array[string]**](string.md) | The kind of objects (i.e. Elasticsearch document types) to include in the search; can include folders and/or files (i.e. dds-folder, dds-file) |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1SearchProvenance**

Search Provenance

Search Provenance related to a start_node by max_hops degrees of separation (default inifinite)

### Example
```bash
dukeds-cli postApiV1SearchProvenance
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **startNode[kind]** | **string** | The kind of start_node |
 **startNode[id]** | **string** | The unique id of start_node |
 **maxHops** | **integer** | Maximum number of degrees of seperation from start node (default infinite) | [optional]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

## **postApiV1SearchProvenanceOrigin**

Search Provenance wasGeneratedBy

This is a targeted query that navigates \"up\" the provenance chain for a file version to see how it was generated (i.e. by what activity) and from what source file versions. Given a list of file versions, this action perform the following query for each file version: 1. Gets the generating activity. 2. For the generating activity, gets the list of wasGeneratedBy and used file versions. A graph structure of the unique nodes and relationships is returned.

### Example
```bash
dukeds-cli postApiV1SearchProvenanceOrigin
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fileVersions[id]** | [**array[string]**](string.md) | The unique file version id. |

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

