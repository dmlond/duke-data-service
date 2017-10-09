# Duke Data Service API. Bash client

## Overview
This is a Bash client script for accessing Duke Data Service API. service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x dukeds-cli

# Print the list of operations available on the service
$ ./dukeds-cli -h

# Print the service description
$ ./dukeds-cli --about

# Print detailed information about specific operation
$ ./dukeds-cli <operationId> -h

# Make GET request
./dukeds-cli --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
dukeds-cli -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' | dukeds-cli --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' | dukeds-cli --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Preview the cURL command without actually executing it
$ dukeds-cli --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image
You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash
The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source dukeds-cli.bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp dukeds-cli.bash-completion /etc/bash-completion.d/dukeds-cli
```

#### OS X
On OSX you might need to install bash-completion using Homebrew:
```shell
brew install bash-completion
```
and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh
In Zsh, the generated `_dukeds-cli` Zsh completion file must be copied to one of the folders under `$FPATH` variable.


## Documentation for API Endpoints

All URIs are relative to **

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ActivitiesApi* | [**deleteApiV1ActivitiesId**](docs/ActivitiesApi.md#deleteapiv1activitiesid) | **DELETE** /api/v1/activities/{id} | Delete a Activity
*ActivitiesApi* | [**getApiV1Activities**](docs/ActivitiesApi.md#getapiv1activities) | **GET** /api/v1/activities | List activities
*ActivitiesApi* | [**getApiV1ActivitiesId**](docs/ActivitiesApi.md#getapiv1activitiesid) | **GET** /api/v1/activities/{id} | View activity details
*ActivitiesApi* | [**postApiV1Activities**](docs/ActivitiesApi.md#postapiv1activities) | **POST** /api/v1/activities | Create a activity
*ActivitiesApi* | [**putApiV1ActivitiesId**](docs/ActivitiesApi.md#putapiv1activitiesid) | **PUT** /api/v1/activities/{id} | Update Activity
*AppApi* | [**getApiV1AppStatus**](docs/AppApi.md#getapiv1appstatus) | **GET** /api/v1/app/status | app status
*AuthProvidersApi* | [**getApiV1AuthProviders**](docs/AuthProvidersApi.md#getapiv1authproviders) | **GET** /api/v1/auth_providers | List Authentication Providers
*AuthProvidersApi* | [**getApiV1AuthProvidersId**](docs/AuthProvidersApi.md#getapiv1authprovidersid) | **GET** /api/v1/auth_providers/{id} | Show Authentication Provider Details
*AuthProvidersApi* | [**getApiV1AuthProvidersIdAffiliates**](docs/AuthProvidersApi.md#getapiv1authprovidersidaffiliates) | **GET** /api/v1/auth_providers/{id}/affiliates | List Auth Provider Affiliates
*AuthProvidersApi* | [**getApiV1AuthProvidersIdAffiliatesUid**](docs/AuthProvidersApi.md#getapiv1authprovidersidaffiliatesuid) | **GET** /api/v1/auth_providers/{id}/affiliates/{uid} | View Auth Provider Affiliate
*AuthProvidersApi* | [**postApiV1AuthProvidersIdAffiliatesUidDdsUser**](docs/AuthProvidersApi.md#postapiv1authprovidersidaffiliatesuidddsuser) | **POST** /api/v1/auth_providers/{id}/affiliates/{uid}/dds_user | Create User Account for Affiliate
*AuthRolesApi* | [**getApiV1AuthRoles**](docs/AuthRolesApi.md#getapiv1authroles) | **GET** /api/v1/auth_roles | List authorization roles for a context
*AuthRolesApi* | [**getApiV1AuthRolesId**](docs/AuthRolesApi.md#getapiv1authrolesid) | **GET** /api/v1/auth_roles/{id} | View authorization role details
*CurrentUserApi* | [**deleteApiV1CurrentUserApiKey**](docs/CurrentUserApi.md#deleteapiv1currentuserapikey) | **DELETE** /api/v1/current_user/api_key | Delete a Current User API key
*CurrentUserApi* | [**getApiV1CurrentUser**](docs/CurrentUserApi.md#getapiv1currentuser) | **GET** /api/v1/current_user | current_user
*CurrentUserApi* | [**getApiV1CurrentUserApiKey**](docs/CurrentUserApi.md#getapiv1currentuserapikey) | **GET** /api/v1/current_user/api_key | View Current User API key
*CurrentUserApi* | [**getApiV1CurrentUserUsage**](docs/CurrentUserApi.md#getapiv1currentuserusage) | **GET** /api/v1/current_user/usage | current_user usage
*CurrentUserApi* | [**putApiV1CurrentUserApiKey**](docs/CurrentUserApi.md#putapiv1currentuserapikey) | **PUT** /api/v1/current_user/api_key | manage current_user api_key
*FileVersionsApi* | [**deleteApiV1FileVersionsId**](docs/FileVersionsApi.md#deleteapiv1fileversionsid) | **DELETE** /api/v1/file_versions/{id} | Delete a file version metadata object
*FileVersionsApi* | [**getApiV1FileVersionsId**](docs/FileVersionsApi.md#getapiv1fileversionsid) | **GET** /api/v1/file_versions/{id} | View file version
*FileVersionsApi* | [**getApiV1FileVersionsIdUrl**](docs/FileVersionsApi.md#getapiv1fileversionsidurl) | **GET** /api/v1/file_versions/{id}/url | Download a file_version
*FileVersionsApi* | [**postApiV1FileVersionsIdCurrent**](docs/FileVersionsApi.md#postapiv1fileversionsidcurrent) | **POST** /api/v1/file_versions/{id}/current | Promote file version
*FileVersionsApi* | [**putApiV1FileVersionsId**](docs/FileVersionsApi.md#putapiv1fileversionsid) | **PUT** /api/v1/file_versions/{id} | Update file version
*FilesApi* | [**deleteApiV1FilesId**](docs/FilesApi.md#deleteapiv1filesid) | **DELETE** /api/v1/files/{id} | Delete a file metadata object
*FilesApi* | [**getApiV1FilesId**](docs/FilesApi.md#getapiv1filesid) | **GET** /api/v1/files/{id} | View file metadata object details
*FilesApi* | [**getApiV1FilesIdUrl**](docs/FilesApi.md#getapiv1filesidurl) | **GET** /api/v1/files/{id}/url | Download a file
*FilesApi* | [**getApiV1FilesIdVersions**](docs/FilesApi.md#getapiv1filesidversions) | **GET** /api/v1/files/{id}/versions | List file versions
*FilesApi* | [**postApiV1Files**](docs/FilesApi.md#postapiv1files) | **POST** /api/v1/files | Create a file
*FilesApi* | [**putApiV1FilesId**](docs/FilesApi.md#putapiv1filesid) | **PUT** /api/v1/files/{id} | Update file properties
*FilesApi* | [**putApiV1FilesIdMove**](docs/FilesApi.md#putapiv1filesidmove) | **PUT** /api/v1/files/{id}/move | Move file
*FilesApi* | [**putApiV1FilesIdRename**](docs/FilesApi.md#putapiv1filesidrename) | **PUT** /api/v1/files/{id}/rename | Rename file
*FoldersApi* | [**deleteApiV1FoldersId**](docs/FoldersApi.md#deleteapiv1foldersid) | **DELETE** /api/v1/folders/{id} | Delete a folder
*FoldersApi* | [**getApiV1FoldersId**](docs/FoldersApi.md#getapiv1foldersid) | **GET** /api/v1/folders/{id} | View folder details
*FoldersApi* | [**getApiV1FoldersIdChildren**](docs/FoldersApi.md#getapiv1foldersidchildren) | **GET** /api/v1/folders/{id}/children | List folder children
*FoldersApi* | [**postApiV1Folders**](docs/FoldersApi.md#postapiv1folders) | **POST** /api/v1/folders | Create a project folder
*FoldersApi* | [**putApiV1FoldersIdMove**](docs/FoldersApi.md#putapiv1foldersidmove) | **PUT** /api/v1/folders/{id}/move | Move folder
*FoldersApi* | [**putApiV1FoldersIdRename**](docs/FoldersApi.md#putapiv1foldersidrename) | **PUT** /api/v1/folders/{id}/rename | Rename folder
*MetaApi* | [**deleteApiV1MetaObjectKindObjectIdTemplateId**](docs/MetaApi.md#deleteapiv1metaobjectkindobjectidtemplateid) | **DELETE** /api/v1/meta/{object_kind}/{object_id}/{template_id} | Delete objet metadata
*MetaApi* | [**getApiV1MetaObjectKindObjectId**](docs/MetaApi.md#getapiv1metaobjectkindobjectid) | **GET** /api/v1/meta/{object_kind}/{object_id} | View all object metadata
*MetaApi* | [**getApiV1MetaObjectKindObjectIdTemplateId**](docs/MetaApi.md#getapiv1metaobjectkindobjectidtemplateid) | **GET** /api/v1/meta/{object_kind}/{object_id}/{template_id} | View object metadata
*MetaApi* | [**postApiV1MetaObjectKindObjectIdTemplateId**](docs/MetaApi.md#postapiv1metaobjectkindobjectidtemplateid) | **POST** /api/v1/meta/{object_kind}/{object_id}/{template_id} | Create object metadata
*MetaApi* | [**putApiV1MetaObjectKindObjectIdTemplateId**](docs/MetaApi.md#putapiv1metaobjectkindobjectidtemplateid) | **PUT** /api/v1/meta/{object_kind}/{object_id}/{template_id} | Update object metadata
*ProjectRolesApi* | [**getApiV1ProjectRoles**](docs/ProjectRolesApi.md#getapiv1projectroles) | **GET** /api/v1/project_roles | List project roles
*ProjectRolesApi* | [**getApiV1ProjectRolesId**](docs/ProjectRolesApi.md#getapiv1projectrolesid) | **GET** /api/v1/project_roles/{id} | View project role details
*ProjectTransfersApi* | [**getApiV1ProjectTransfers**](docs/ProjectTransfersApi.md#getapiv1projecttransfers) | **GET** /api/v1/project_transfers | View all project transfers
*ProjectTransfersApi* | [**getApiV1ProjectTransfersId**](docs/ProjectTransfersApi.md#getapiv1projecttransfersid) | **GET** /api/v1/project_transfers/{id} | View a project transfer
*ProjectTransfersApi* | [**putApiV1ProjectTransfersIdAccept**](docs/ProjectTransfersApi.md#putapiv1projecttransfersidaccept) | **PUT** /api/v1/project_transfers/{id}/accept | Accept a project transfer
*ProjectTransfersApi* | [**putApiV1ProjectTransfersIdCancel**](docs/ProjectTransfersApi.md#putapiv1projecttransfersidcancel) | **PUT** /api/v1/project_transfers/{id}/cancel | Cancel a project transfer
*ProjectTransfersApi* | [**putApiV1ProjectTransfersIdReject**](docs/ProjectTransfersApi.md#putapiv1projecttransfersidreject) | **PUT** /api/v1/project_transfers/{id}/reject | Reject a project transfer
*ProjectsApi* | [**deleteApiV1ProjectsId**](docs/ProjectsApi.md#deleteapiv1projectsid) | **DELETE** /api/v1/projects/{id} | Delete a project
*ProjectsApi* | [**deleteApiV1ProjectsProjectIdAffiliatesUserId**](docs/ProjectsApi.md#deleteapiv1projectsprojectidaffiliatesuserid) | **DELETE** /api/v1/projects/{project_id}/affiliates/{user_id} | Delete project affiliation
*ProjectsApi* | [**deleteApiV1ProjectsProjectIdPermissionsUserId**](docs/ProjectsApi.md#deleteapiv1projectsprojectidpermissionsuserid) | **DELETE** /api/v1/projects/{project_id}/permissions/{user_id} | Revoke project level permissions for user
*ProjectsApi* | [**getApiV1Projects**](docs/ProjectsApi.md#getapiv1projects) | **GET** /api/v1/projects | List projects
*ProjectsApi* | [**getApiV1ProjectsId**](docs/ProjectsApi.md#getapiv1projectsid) | **GET** /api/v1/projects/{id} | View project details
*ProjectsApi* | [**getApiV1ProjectsIdChildren**](docs/ProjectsApi.md#getapiv1projectsidchildren) | **GET** /api/v1/projects/{id}/children | List project children
*ProjectsApi* | [**getApiV1ProjectsProjectIdAffiliates**](docs/ProjectsApi.md#getapiv1projectsprojectidaffiliates) | **GET** /api/v1/projects/{project_id}/affiliates | List project affiliations
*ProjectsApi* | [**getApiV1ProjectsProjectIdAffiliatesUserId**](docs/ProjectsApi.md#getapiv1projectsprojectidaffiliatesuserid) | **GET** /api/v1/projects/{project_id}/affiliates/{user_id} | View project level affiliation for a user
*ProjectsApi* | [**getApiV1ProjectsProjectIdPermissions**](docs/ProjectsApi.md#getapiv1projectsprojectidpermissions) | **GET** /api/v1/projects/{project_id}/permissions | List project level permissions
*ProjectsApi* | [**getApiV1ProjectsProjectIdPermissionsUserId**](docs/ProjectsApi.md#getapiv1projectsprojectidpermissionsuserid) | **GET** /api/v1/projects/{project_id}/permissions/{user_id} | View project level permissions for a user
*ProjectsApi* | [**getApiV1ProjectsProjectIdTransfers**](docs/ProjectsApi.md#getapiv1projectsprojectidtransfers) | **GET** /api/v1/projects/{project_id}/transfers | List project transfers
*ProjectsApi* | [**getApiV1ProjectsProjectIdUploads**](docs/ProjectsApi.md#getapiv1projectsprojectiduploads) | **GET** /api/v1/projects/{project_id}/uploads | List file uploads for a project
*ProjectsApi* | [**postApiV1Projects**](docs/ProjectsApi.md#postapiv1projects) | **POST** /api/v1/projects | Create a project
*ProjectsApi* | [**postApiV1ProjectsProjectIdTransfers**](docs/ProjectsApi.md#postapiv1projectsprojectidtransfers) | **POST** /api/v1/projects/{project_id}/transfers | Initiate a project transfer
*ProjectsApi* | [**postApiV1ProjectsProjectIdUploads**](docs/ProjectsApi.md#postapiv1projectsprojectiduploads) | **POST** /api/v1/projects/{project_id}/uploads | Initiate a chunked file upload for a project
*ProjectsApi* | [**putApiV1ProjectsId**](docs/ProjectsApi.md#putapiv1projectsid) | **PUT** /api/v1/projects/{id} | Update a project
*ProjectsApi* | [**putApiV1ProjectsProjectIdAffiliatesUserId**](docs/ProjectsApi.md#putapiv1projectsprojectidaffiliatesuserid) | **PUT** /api/v1/projects/{project_id}/affiliates/{user_id} | Associate affiliate to a project
*ProjectsApi* | [**putApiV1ProjectsProjectIdPermissionsUserId**](docs/ProjectsApi.md#putapiv1projectsprojectidpermissionsuserid) | **PUT** /api/v1/projects/{project_id}/permissions/{user_id} | Grant project level permissions to a user
*RelationsApi* | [**deleteApiV1RelationsId**](docs/RelationsApi.md#deleteapiv1relationsid) | **DELETE** /api/v1/relations/{id} | Delete relation
*RelationsApi* | [**getApiV1RelationsId**](docs/RelationsApi.md#getapiv1relationsid) | **GET** /api/v1/relations/{id} | View relation
*RelationsApi* | [**getApiV1RelationsObjectKindObjectId**](docs/RelationsApi.md#getapiv1relationsobjectkindobjectid) | **GET** /api/v1/relations/{object_kind}/{object_id} | List provenance relations
*RelationsApi* | [**postApiV1RelationsUsed**](docs/RelationsApi.md#postapiv1relationsused) | **POST** /api/v1/relations/used | Create used relation
*RelationsApi* | [**postApiV1RelationsWasDerivedFrom**](docs/RelationsApi.md#postapiv1relationswasderivedfrom) | **POST** /api/v1/relations/was_derived_from | Create was derived from relation
*RelationsApi* | [**postApiV1RelationsWasGeneratedBy**](docs/RelationsApi.md#postapiv1relationswasgeneratedby) | **POST** /api/v1/relations/was_generated_by | Create was generated by relation
*RelationsApi* | [**postApiV1RelationsWasInvalidatedBy**](docs/RelationsApi.md#postapiv1relationswasinvalidatedby) | **POST** /api/v1/relations/was_invalidated_by | Create was invalidated by relation
*SearchApi* | [**postApiV1Search**](docs/SearchApi.md#postapiv1search) | **POST** /api/v1/search | Search Objects
*SearchApi* | [**postApiV1SearchProvenance**](docs/SearchApi.md#postapiv1searchprovenance) | **POST** /api/v1/search/provenance | Search Provenance
*SearchApi* | [**postApiV1SearchProvenanceOrigin**](docs/SearchApi.md#postapiv1searchprovenanceorigin) | **POST** /api/v1/search/provenance/origin | Search Provenance wasGeneratedBy
*SoftwareAgentsApi* | [**deleteApiV1SoftwareAgentsId**](docs/SoftwareAgentsApi.md#deleteapiv1softwareagentsid) | **DELETE** /api/v1/software_agents/{id} | Delete a Software Agent
*SoftwareAgentsApi* | [**deleteApiV1SoftwareAgentsIdApiKey**](docs/SoftwareAgentsApi.md#deleteapiv1softwareagentsidapikey) | **DELETE** /api/v1/software_agents/{id}/api_key | Delete software agent API key
*SoftwareAgentsApi* | [**getApiV1SoftwareAgents**](docs/SoftwareAgentsApi.md#getapiv1softwareagents) | **GET** /api/v1/software_agents | List software agents
*SoftwareAgentsApi* | [**getApiV1SoftwareAgentsId**](docs/SoftwareAgentsApi.md#getapiv1softwareagentsid) | **GET** /api/v1/software_agents/{id} | View software agent details
*SoftwareAgentsApi* | [**getApiV1SoftwareAgentsIdApiKey**](docs/SoftwareAgentsApi.md#getapiv1softwareagentsidapikey) | **GET** /api/v1/software_agents/{id}/api_key | View software agent API key
*SoftwareAgentsApi* | [**postApiV1SoftwareAgents**](docs/SoftwareAgentsApi.md#postapiv1softwareagents) | **POST** /api/v1/software_agents | Create a software agent
*SoftwareAgentsApi* | [**postApiV1SoftwareAgentsApiToken**](docs/SoftwareAgentsApi.md#postapiv1softwareagentsapitoken) | **POST** /api/v1/software_agents/api_token | Get software agent access token
*SoftwareAgentsApi* | [**putApiV1SoftwareAgentsId**](docs/SoftwareAgentsApi.md#putapiv1softwareagentsid) | **PUT** /api/v1/software_agents/{id} | Update Software Agent
*SoftwareAgentsApi* | [**putApiV1SoftwareAgentsIdApiKey**](docs/SoftwareAgentsApi.md#putapiv1softwareagentsidapikey) | **PUT** /api/v1/software_agents/{id}/api_key | Re-generate software agent API key
*StorageProvidersApi* | [**getApiV1StorageProviders**](docs/StorageProvidersApi.md#getapiv1storageproviders) | **GET** /api/v1/storage_providers | List storage providers
*StorageProvidersApi* | [**getApiV1StorageProvidersId**](docs/StorageProvidersApi.md#getapiv1storageprovidersid) | **GET** /api/v1/storage_providers/{id} | View storage provider
*SystemApi* | [**deleteApiV1SystemPermissionsUserId**](docs/SystemApi.md#deleteapiv1systempermissionsuserid) | **DELETE** /api/v1/system/permissions/{user_id} | Revoke system permissions to user
*SystemApi* | [**getApiV1SystemPermissions**](docs/SystemApi.md#getapiv1systempermissions) | **GET** /api/v1/system/permissions | List system permissions
*SystemApi* | [**getApiV1SystemPermissionsUserId**](docs/SystemApi.md#getapiv1systempermissionsuserid) | **GET** /api/v1/system/permissions/{user_id} | View system level permissions for user
*SystemApi* | [**putApiV1SystemPermissionsUserId**](docs/SystemApi.md#putapiv1systempermissionsuserid) | **PUT** /api/v1/system/permissions/{user_id} | Grant system level permission to user
*TagsApi* | [**deleteApiV1TagsId**](docs/TagsApi.md#deleteapiv1tagsid) | **DELETE** /api/v1/tags/{id} | Delete a tag
*TagsApi* | [**getApiV1TagsId**](docs/TagsApi.md#getapiv1tagsid) | **GET** /api/v1/tags/{id} | View tag
*TagsApi* | [**getApiV1TagsLabels**](docs/TagsApi.md#getapiv1tagslabels) | **GET** /api/v1/tags/labels | List tag labels
*TagsApi* | [**getApiV1TagsObjectKindObjectId**](docs/TagsApi.md#getapiv1tagsobjectkindobjectid) | **GET** /api/v1/tags/{object_kind}/{object_id} | List tag objects
*TagsApi* | [**postApiV1TagsObjectKindObjectId**](docs/TagsApi.md#postapiv1tagsobjectkindobjectid) | **POST** /api/v1/tags/{object_kind}/{object_id} | Create object tag
*TagsApi* | [**postApiV1TagsObjectKindObjectIdAppend**](docs/TagsApi.md#postapiv1tagsobjectkindobjectidappend) | **POST** /api/v1/tags/{object_kind}/{object_id}/append | Append a list of object tags
*TemplatePropertiesApi* | [**deleteApiV1TemplatePropertiesId**](docs/TemplatePropertiesApi.md#deleteapiv1templatepropertiesid) | **DELETE** /api/v1/template_properties/{id} | Delete a template property
*TemplatePropertiesApi* | [**getApiV1TemplatePropertiesId**](docs/TemplatePropertiesApi.md#getapiv1templatepropertiesid) | **GET** /api/v1/template_properties/{id} | View property details
*TemplatePropertiesApi* | [**putApiV1TemplatePropertiesId**](docs/TemplatePropertiesApi.md#putapiv1templatepropertiesid) | **PUT** /api/v1/template_properties/{id} | Update template property
*TemplatesApi* | [**deleteApiV1TemplatesId**](docs/TemplatesApi.md#deleteapiv1templatesid) | **DELETE** /api/v1/templates/{id} | Delete a template
*TemplatesApi* | [**getApiV1Templates**](docs/TemplatesApi.md#getapiv1templates) | **GET** /api/v1/templates | List templates
*TemplatesApi* | [**getApiV1TemplatesId**](docs/TemplatesApi.md#getapiv1templatesid) | **GET** /api/v1/templates/{id} | View template details
*TemplatesApi* | [**getApiV1TemplatesTemplateIdProperties**](docs/TemplatesApi.md#getapiv1templatestemplateidproperties) | **GET** /api/v1/templates/{template_id}/properties | List properties
*TemplatesApi* | [**postApiV1Templates**](docs/TemplatesApi.md#postapiv1templates) | **POST** /api/v1/templates | Create template
*TemplatesApi* | [**postApiV1TemplatesTemplateIdProperties**](docs/TemplatesApi.md#postapiv1templatestemplateidproperties) | **POST** /api/v1/templates/{template_id}/properties | Create property
*TemplatesApi* | [**putApiV1TemplatesId**](docs/TemplatesApi.md#putapiv1templatesid) | **PUT** /api/v1/templates/{id} | Update template
*UploadsApi* | [**getApiV1UploadsId**](docs/UploadsApi.md#getapiv1uploadsid) | **GET** /api/v1/uploads/{id} | View upload details/status
*UploadsApi* | [**putApiV1UploadsIdChunks**](docs/UploadsApi.md#putapiv1uploadsidchunks) | **PUT** /api/v1/uploads/{id}/chunks | Get pre-signed URL to upload the next chunk
*UploadsApi* | [**putApiV1UploadsIdComplete**](docs/UploadsApi.md#putapiv1uploadsidcomplete) | **PUT** /api/v1/uploads/{id}/complete | Complete the chunked file upload
*UploadsApi* | [**putApiV1UploadsIdHashes**](docs/UploadsApi.md#putapiv1uploadsidhashes) | **PUT** /api/v1/uploads/{id}/hashes | Report upload hash
*UserApi* | [**getApiV1UserApiToken**](docs/UserApi.md#getapiv1userapitoken) | **GET** /api/v1/user/api_token | api_token
*UsersApi* | [**getApiV1Users**](docs/UsersApi.md#getapiv1users) | **GET** /api/v1/users | users
*UsersApi* | [**getApiV1UsersId**](docs/UsersApi.md#getapiv1usersid) | **GET** /api/v1/users/{id} | View user details


## Documentation For Models



## Documentation For Authorization


## api_key

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

