A mongodb database containing Best Buy product data from the Bulk Download API

https://developer.bestbuy.com/documentation/bulkDownload-api

```
docker run -d --name bestbuy_mongodb -e BESTBUY_API_KEY=<your_api_key> bigwednesdayio/bestbuy_mongodb
docker exec -it bestbuy_mongodb import.sh
```
