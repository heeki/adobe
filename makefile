include etc/environment.sh

stock: stock.curl stock.list
stock.curl:
	curl -s https://stock.adobe.io/Rest/Media/1/Search/Files\?locale\=en_US%26search_parameters%5Bwords%5D\=kittens \
	-H x-product:testapp \
	-H x-api-key:${STOCK_CLIENT_ID} | jq > tmp/stock.json
stock.list:
	cat tmp/stock.json | jq -c '.files[] | del(.title, .thumbnail_url, .thumbnail_html_tag, .stock_id)'
photoshop.generate_token:
	curl -s -X POST https://ims-na1.adobelogin.com/ims/token/v3 \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-d "grant_type=client_credentials&client_id=${PHOTOSHOP_CLIENT_ID}&client_secret=${PHOTOSHOP_CLIENT_SECRET}&scope=openid,AdobeID,read_organizations" | jq > tmp/photoshop_token.json
photoshop.view_token:
	cat tmp/photoshop_token.json | jq
photoshop.hello:
	curl -s -X GET https://image.adobe.io/pie/psdService/hello \
	-H "Authorization: Bearer ${PHOTOSHOP_ACCESS_KEY}" \
	-H "x-api-key: ${PHOTOSHOP_CLIENT_ID}"
photoshop.manifest:
	node src/11_getDocumentManifest.js | jq > tmp/manifest.json
	cat tmp/manifest.json | jq