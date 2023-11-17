## Overview
This repository implements an example using the Adobe Developer APIs.

## Pre-requisites
You first need to setup a project and generate client credentials per [documentation](https://developer.adobe.com/photoshop/photoshop-api-docs/getting-started/).

Copy `etc/environment.template` to `etc/environment.sh` and update accordingly.
* `PROFILE`: your AWS CLI profile with the appropriate credentials to deploy
* `REGION`: your AWS region
* `BUCKET`: your configuration bucket
* `STOCK_CLIENT_ID`: client id for Adobe Stock
* `PHOTOSHOP_ORG_ID`: organization id for Adobe Photoshop
* `PHOTOSHOP_CLIENT_ID`: client id (api key) id for Adobe Photoshop
* `PHOTOSHOP_CLIENT_SECRET`: client secret for Adobe Photoshop
* `AWS_ACCESS_KEY_ID`: access key for AWS CLI
* `AWS_SECRET_ACCESS_KEY`: secret access key for AWS CLI

## Testing Adobe Stock
Test a search query for the Adobe Stock API: `make stock`

## Testing Adobe Photoshop
Generate an access token for use with API calls: `make photoshop.generate_token`  
View the access token: `make photoshop.view_token`  
Make a basic hello world API call: `make photoshop.hello`  
Request a document manifest via script: `make photoshop.manifest`  
Cutout backgrounds via script: `make photoshop.cutout`

## Attribution
Many of the code samples for using the Adobe API have been copied from this [repository](https://github.com/adobe/adobe-photoshop-api-sdk).