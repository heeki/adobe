/*
Copyright 2023 Adobe
All Rights Reserved.

NOTICE: Adobe permits you to use, modify, and distribute this file in
accordance with the terms of the Adobe license agreement accompanying
it.
*/

// How to run:
// node src/sample/psapi/01_createCutout.js

const awsLib = require('./lib/awsLib')
const sdk = require('../config/config')

main()

async function main() {
  try {
    const client = await sdk.initSDK()
    const input = {
      // href: await awsLib.getSignedUrl('getObject', 'input/input01.jpg'), //ex: AWS S3 (s3://<awsConfig.bucketName>/input/input01.jpg)
      href: 'https://raw.githubusercontent.com/adobe/adobe-photoshop-api-sdk/main/testfiles/input/input01.jpg',
      storage: sdk.psApiLib.Storage.EXTERNAL,
    }
    const output = {
      href: await awsLib.getSignedUrl('putObject', 'cutout/test01.png'),
      storage: sdk.psApiLib.Storage.EXTERNAL,
      type: sdk.psApiLib.MimeType.PNG
    }
    const job = await client.createCutout(input, output)
    const url = await awsLib.getSignedUrl('getObject', 'cutout/test01.png')
    const response = {
      job: job,
      url: url
    }
    // console.log(`${JSON.stringify(job,null,2)}\n`)
    console.log(JSON.stringify(response))
  } catch (e) {
    console.error(e)
  }
}